library(sensitivity)


### Name: sobolroalhs
### Title: Sobol' Indices Estimation Using Replicated OA-based LHS
### Aliases: sobolroalhs tell.sobolroalhs print.sobolroalhs
###   plot.sobolroalhs
### Keywords: design

### ** Examples

library(boot)
library(numbers)

####################
# Test case: the non-monotonic Sobol g-function

# The method of sobol requires 2 samples
# (there are 8 factors, all following the uniform distribution on [0,1])

# first-order sensitivity indices
x <- sobolroalhs(model = sobol.fun, factors = 8, N = 1000, order = 1, nboot=100)
print(x)
plot(x)

# closed second-order sensitivity indices
x <- sobolroalhs(model = sobol.fun, factors = 8, N = 1000, order = 2, nboot=100)
print(x)
plot(x)

####################
# Test case: dealing with non-uniform distributions

x <- sobolroalhs(model = NULL, factors = 3, N = 1000, order =1, nboot=0)

# X1 follows a log-normal distribution:
x$X[,1] <- qlnorm(x$X[,1])

# X2 follows a standard normal distribution:
x$X[,2] <- qnorm(x$X[,2])

# X3 follows a gamma distribution:
x$X[,3] <- qgamma(x$X[,3],shape=0.5)

# toy example
toy <- function(x){rowSums(x)}
y <- toy(x$X)
tell(x, y)
print(x)
plot(x)

####################
# Test case : multidimensional outputs

toy <- function(x){cbind(x[,1]+x[,2]+x[,1]*x[,2],2*x[,1]+3*x[,1]*x[,2]+x[,2])}
x <- sobolroalhs(model = toy, factors = 3, N = 1000, p=2, order =1, nboot=100)
print(x)
plot(x)



