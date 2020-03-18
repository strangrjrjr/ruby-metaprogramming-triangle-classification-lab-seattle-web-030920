class Triangle
  # write code here

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    #no negatives
    if @side_a <= 0 or (@side_a + @side_b) <= @side_c
      raise TriangleError
    elsif @side_b <= 0 or (@side_b + @side_c) <= @side_a
      raise TriangleError
    elsif @side_c <= 0 or (@side_a + @side_c) <= @side_b
      raise TriangleError
    end

    if @side_a > 0 and @side_b > 0 and @side_c > 0
      if (@side_a + @side_b) > @side_c or (@side_b + @side_c) > @side_a or (@side_a + @side_c) > side_b
        #continue
        if @side_a == @side_b and @side_b == @side_c
          return :equilateral
        elsif @side_a == @side_b or @side_a == @side_c or @side_b == @side_c
          return :isosceles
        elsif @side_a != @side_b and @side_a != @side_c and @side_b != @side_c
          return :scalene
        end
      else
        #error
        begin
          raise TriangleError
        rescue TriangleError => error
          puts error.message
        end
      end
    else 
      #error
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end
  end

  class TriangleError < StandardError
    # triangle error code
    def message
      puts "Ain't a damn triangle!"
    end
  end
end
