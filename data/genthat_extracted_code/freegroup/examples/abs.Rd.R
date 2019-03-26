library(freegroup)


### Name: abs.free
### Title: Absolute value of a 'free' object
### Aliases: abs.free abs

### ** Examples


abs(abc(-5:5))

a <- rfree(10,4,7)
b <- rfree(10,4,7)

a
abs(a)

## following should all be TRUE:
all(size(abs(a+b))  <=  size(abs(a) + abs(b)))
all(total(abs(a+b)) <=  total(abs(a) + abs(b)))
all(number(abs(a+b)) <= number(abs(a) + abs(b)))

all(size(a+b)   <= size(abs(a) + abs(b)))
all(total(a+b)  <= total(abs(a) + abs(b)))
all(number(a+b) <= number(abs(a) + abs(b)))




