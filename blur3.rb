

class Image
  attr_accessor :image, :ones, :distance
  def initialize(data)
   @image = data
  end


 def data
    @image.each do |row|
      puts row.join(" ")
    end
  end

def get_ones_positions
    @ones = []
    @image.each_with_index do |row, rn|
      row.each_with_index do |item, cn|
        if item == 1
          ones << [rn, cn]
        end
      end
    end
    return ones
  end

  def blur(distance) 
    @distance = 3
    @distance.times do
      get_ones_positions.each do |rn_found, cn_found|
        set_up(rn_found, cn_found)
      end
    end
  end 
  
 

  def set_up(rn, cn)
    @image[rn][cn - 1] = 1 if cn - 1 >= 0
    @image[rn][cn + 1] = 1 if cn + 1 < @image[rn].length 
    @image[rn - 1][cn] = 1 if rn - 1 >= 0
    @image[rn + 1][cn] = 1 if rn < @image[cn].length
  end



end
distance = @distance

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])


image.data
puts " "

image.blur(distance)
image.data
