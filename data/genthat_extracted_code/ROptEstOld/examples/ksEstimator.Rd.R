library(ROptEstOld)


### Name: ksEstimator
### Title: Generic Function for the Computation of the Kolmogorov Minimum
###   Distance Estimator
### Aliases: ksEstimator ksEstimator-methods
###   ksEstimator,numeric,Binom-method ksEstimator,numeric,Pois-method
###   ksEstimator,numeric,Norm-method ksEstimator,numeric,Lnorm-method
###   ksEstimator,numeric,Gumbel-method ksEstimator,numeric,Exp-method
###   ksEstimator,numeric,Gammad-method
### Keywords: robust

### ** Examples

x <- rnorm(100, mean = 1, sd = 2)
ksEstimator(x=x, distribution = Norm()) # estimate mean and sd
ksEstimator(x=x, distribution = Norm(mean = 1), param = "sd") # estimate sd
ksEstimator(x=x, distribution = Norm(sd = 2), param = "mean") # estimate mean
mean(x)
median(x)
sd(x)
mad(x)



