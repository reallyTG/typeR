library(robets)


### Name: tau2
### Title: Compute the tau2 estimator of scale
### Aliases: tau2

### ** Examples

set.seed(100)
e <- 10*rnorm(100)
mse <- mean(e^2) 
tse <- tau2(e) 



