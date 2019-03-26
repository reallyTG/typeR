library(PDQutils)


### Name: moment2cumulant
### Title: Convert moments to raw cumulants.
### Aliases: moment2cumulant
### Keywords: distribution

### ** Examples

# normal distribution, mean 0, variance 1
n.cum <- moment2cumulant(c(0,1,0,3,0,15))
# normal distribution, mean 1, variance 1
n.cum <- moment2cumulant(c(1,2,4,10,26))
# exponential distribution
lambda <- 0.7
n <- 1:6
e.cum <- moment2cumulant(factorial(n) / (lambda^n))



