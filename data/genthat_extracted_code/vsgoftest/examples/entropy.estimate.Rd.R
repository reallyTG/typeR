library(vsgoftest)


### Name: entropy.estimate
### Title: Vasicek estimate of differential Shannon Entropy
### Aliases: entropy.estimate
### Keywords: Differential Shannon entropy

### ** Examples

set.seed(2)
samp <- rnorm(100, mean = 0, s = 1)
entropy.estimate(x = samp, window = 8)
log(2*pi*exp(1))/2 #true value of entropy of normal distribution



