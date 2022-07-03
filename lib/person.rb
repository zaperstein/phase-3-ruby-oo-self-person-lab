# your code goes here
class Person

  #read up on the function of setters and getters
  #read up on accessors, readers, and writers
  attr_reader :name, :bank_account, :happiness, :hygiene
  attr_accessor :bank_account 
  def initialize(name)
      @name=name
      @bank_account = 25
      @happiness = 8
      @hygiene = 8
  end

  def happiness=(happiness)
    #can't use a ternary operator here because the logic is has too many steps
    @happiness =  if happiness > 10
      10
    elsif happiness < 0
      0
    else
      happiness
    end
  end
  # a method called clamp is an option if your ruby version is past 2.4
  # @happiness = num.clamp(0, 10)
  def hygiene=(number)
     @hygiene = if number > 10 
       10
     elsif number < 0
       0
     else
      number
     end
  end

  def happy?
    happiness > 7 ? true : false
  end

  def clean? 
    hygiene > 7? true : false
  end

  def get_paid(amount)
    @bank_account = bank_account + amount
    "all about the benjamins"
  end

  def take_bath
    #why does using self cause this test to pass -- link it to the hygiene method maybe? local variables feel relevant
    self.hygiene += 4
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.hygiene -= 3
    self.happiness += 2
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness += 3
    friend.happiness += 3
    #review instance methods vs class methods
    "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  def start_conversation (friend, topic)
    case topic
    when "politics"
      # [self, friend].each {|person| person.happiness -= 2}
      self.happiness -= 2
      friend.happiness -= 2
      "blah blah partisan blah lobbyist"
    when "weather"
      # [self, friend].each {|person| person.happiness += 1}
      self.happiness += 1
      friend.happiness += 1
      return "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end