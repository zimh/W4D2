class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    return (@salary) * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, direct_reports)
    super(name,title,salary,boss)
    @direct_reports = direct_reports
  end

  def bonus(multiplier)
    #total_salary = @direct_reports.inject {|acc, ele| acc += ele.salary} #* multiplier
    total_salary = 0
    @direct_reports.each do |emp|
      if emp.class == Manager 
        total_salary += emp.bonus(1)
      end
      total_salary += emp.salary
    end
    return total_salary * multiplier
  end
end

david = Employee.new("David", "TA", 10000, nil)
shawna = Employee.new("Shawna", "TA", 12000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil, [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

# david.boss = darren
# shawna.boss = darren
# darren.boss = ned
p david



# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000