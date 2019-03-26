library(distr)


### Name: Weibull-class
### Title: Class "Weibull"
### Aliases: Weibull-class Weibull initialize,Weibull-method
### Keywords: distribution

### ** Examples

W <- Weibull(shape=1,scale=1) # W is a Weibull distribution with shape=1 and scale=1.
r(W)(1) # one random number generated from this distribution, e.g. 0.5204105
d(W)(1) # Density of this distribution is 0.3678794 for x=1.
p(W)(1) # Probability that x<1 is 0.6321206.
q(W)(.1) # Probability that x<0.1053605 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
shape(W) # shape of this distribution is 1.
shape(W) <- 2 # shape of this distribution is now 2.



