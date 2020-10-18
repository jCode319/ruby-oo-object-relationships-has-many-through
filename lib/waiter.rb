class Waiter
    attr_accessor :name, :experience

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tip = meals.max do |a, b| 
            a.tip <=> b.tip
        end
        best_tip.customer
        
    end


end