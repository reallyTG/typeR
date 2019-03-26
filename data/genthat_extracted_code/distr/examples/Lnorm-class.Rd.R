library(distr)


### Name: Lnorm-class
### Title: Class "Lnorm"
### Aliases: Lnorm-class Lnorm initialize,Lnorm-method
### Keywords: distribution

### ** Examples

L <- Lnorm(meanlog=1,sdlog=1) # L is a lnorm distribution with mean=1 and sd=1.
r(L)(1) # one random number generated from this distribution, e.g. 3.608011
d(L)(1) # Density of this distribution is 0.2419707 for x=1.
p(L)(1) # Probability that x<1 is 0.1586553.
q(L)(.1) # Probability that x<0.754612 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
meanlog(L) # meanlog of this distribution is 1.
meanlog(L) <- 2 # meanlog of this distribution is now 2.



