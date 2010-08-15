class Actor < Chingu::GameObject
	traits :timer
	@@speed = 1
	
	def initialize(options={})
	  super(:x => 100, :y => 100)
		self.input = {:holding_left => :move_left, :holding_right => :move_right, :holding_down => :move_down, :holding_up => :move_up}
		
		@animation = Chingu::Animation.new(:file => "./media/warrior.png", :size => [-3 ,-4], :loop => true)
    @animation.frame_names = { :up => 9..11, :down => 0..2, :left => 3..5, :right => 6..8 }
    @frame_name = :left
		@moving = false
		update
		
	end
	
  def move_left
    @x -= @@speed
		@frame_name = :left
		@moving = true
  end

  def move_right
    @x += @@speed
		@frame_name = :right
		@moving = true
  end
	
	def move_up
    @y -= @@speed
		@frame_name = :up
		@moving = true
  end

  def move_down
    @y += @@speed
		@frame_name = :down
		@moving = true
  end
	
	def update
		if @moving
			@image = @animation[@frame_name].next
		else
			@image = @animation[@frame_name].last
		end
		
		@moving = false
  end
end