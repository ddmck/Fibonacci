require 'matrix'

def method_timer(method)
  beg = Time.now
  method
  done = Time.now
  #puts "Time taken is #{(done - beg)*1000}."
  return ((done - beg)*1000)
end

def average_time(samples, timer)
  total = 0
  n = 1
  until n > samples
    total += timer
  	n += 1
  end
  return (total / samples)
end

def fibbo_array(n)
  fibbo = [0, 1]
  x = 2
  until x > n
    fibbo[x] = fibbo[-1] + fibbo[-2]
    x += 1
  end
  return fibbo.last
end 
  

def fib(n)
  return n if n < 2
  vals = [0, 1]
  (n-1).times do 
    vals.push(vals[-1] + vals[-2]) 
  end
  return vals.last
end

def fib_rec(n)
  return n if (0..1).include? n
  fib(n-1) + fib(n-2) if n > 1
end

def fib_lin(n)
  curr = 0
  succ = 1

  n.times do |i|
    curr, succ = succ, curr + succ
  end

  return curr
end

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fib_mat(n)
  (FIB_MATRIX**(n-1))[0,0]
end

# Models rabbit population via adding death by subtracting the population n-4 
# from the nth population. 
def rabbits(n)
  fibbo = [0, 1]
  x = 2
  until x > n
  	if x > 4
      fibbo[x] = fibbo[-1] + fibbo[-2] - fibbo[-4]
    else
      fibbo[x] = fibbo[-1] + fibbo[-2]
    end
    x += 1
  end
  return fibbo.last
end 

n = 100000

#puts "fib push: ", average_time(25,method_timer(fib(n)))

#puts "fib don: ", average_time(25, method_timer(fibbo_array(n)))

#puts "fib rec: ", average_time(25,method_timer(fib_rec(n)))

#puts "fib lin: ", average_time(25,method_timer(fib_lin(n)))

#puts "fib mat: ", average_time(1,method_timer(fib_mat(n)))

puts rabbits(n)
