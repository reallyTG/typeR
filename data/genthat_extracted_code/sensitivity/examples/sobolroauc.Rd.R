library(sensitivity)


### Name: sobolroauc
### Title: Sobol' Indices estimation under inequality constraints
### Aliases: sobolroauc tell.sobolroauc print.sobolroauc plot.sobolroauc
### Keywords: design

### ** Examples

library(boot)
library(numbers)

# Test case: the non-monotonic Sobol g-function
# (there are 8 factors, all following the uniform distribution on [0,1])

# Suppose we have the inequality constraints: X1 <= X3 and X4 <= X6.

# first-order sensitivity indices
x <- sobolroauc(model = sobol.fun, factors = 8, constraints = list(c(1,3),c(4,6)), 
                N = 1000, order = 1, nboot=100)
print(x)
plot(x)

# closed second-order sensitivity indices
x <- sobolroauc(model = sobol.fun, factors = 8, constraints = list(c(1,3),c(4,6)), 
                N = 1000, order = 2, nboot=100)
print(x)
plot(x)




