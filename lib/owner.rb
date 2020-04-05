class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map { |dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map { |cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.map do |dog|
      dog.owner = nil 
      dog.mood = "nervous"
    end
    cats.map do |cat| 
      cat.owner = nil
      cat.mood = "nervous"
    end
  end
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
  
  

end