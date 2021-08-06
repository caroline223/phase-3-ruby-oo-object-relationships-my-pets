class Owner
  # code goes here

  attr_reader :name, :species

  #Instance methods

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all 
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  #Associations

  def cats
   Cat.all.filter{ |cat| cat.owner == self }
  end

  def dogs
    Dog.all.filter {|dog| dog.owner == self }
  end

  def buy_cat(cat)
   Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.map{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.map{|pet| pet.mood = "nervous" ; pet.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end