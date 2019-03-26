library(lambda.tools)


### Name: fold
### Title: Successively apply a function to the elements of a sequence
### Aliases: fold

### ** Examples

x <- 1:10

# This is equivalent to the summation operator
sum(x) == fold(x, function(a,b) a+b, 0)
sum(x^2) == fold(x, function(a,b) a^2 + b, 0)

# This is equivalent to the product operator
prod(x) == fold(x, function(a,b) a*b, 1)

# Note the equivalence with map
x <- matrix(1:24, ncol=4)
map(t(x), function(a) sum(a)) == fold(x, function(a,b) a + b, 0)




