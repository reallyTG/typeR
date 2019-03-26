library(DiscreteWeibull)


### Name: estdweibull
### Title: Estimation of parameters
### Aliases: estdweibull
### Keywords: htest distribution

### ** Examples

# Ex1
n <- 10
q <- 0.5
beta <- 0.8
x <- rdweibull(n, q, beta)
estdweibull(x, "ML") # maximum likelihood method
# it may return some harmless warnings
# that depend on the optimization function used in the maximization routine
estdweibull(x, "M") # method of moments
estdweibull(x, "P") # method of proportion
# the estimates provided by the three methods may be quite different
# from the true values... and to each other
# change the sample size
n <- 50
q <- 0.5
beta <- 0.8
x <- rdweibull(n, q, beta)
estdweibull(x, "ML") # maximum likelihood method
estdweibull(x, "M") # method of moments
estdweibull(x, "P") # method of proportion
# the estimates should be (on average) closer to the true values
# ...and to each other

# When the estimation methods fail...
# Ex2
# only 1s and 2s
x <- c(1,1,1,1,1,1,2,2,2,2)
estdweibull(x, "ML") # fails!
estdweibull(x, "M") # fails!
estdweibull(x, "P") # fails!

# Ex3
# no 1s
x <- c(2,2,3,4,5,5,5,6,6,8,10)
estdweibull(x, "ML") # works
estdweibull(x, "M") # works
estdweibull(x, "P") # fails!



