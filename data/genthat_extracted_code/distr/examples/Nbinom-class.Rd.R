library(distr)


### Name: Nbinom-class
### Title: Class "Nbinom"
### Aliases: Nbinom-class Nbinom initialize,Nbinom-method
### Keywords: distribution

### ** Examples

N <- Nbinom(prob = 0.5, size = 1) # N is a binomial distribution with prob=0.5 and size=1.
r(N)(1) # one random number generated from this distribution, e.g. 3
d(N)(1) # Density of this distribution is  0.25 for x=1.
p(N)(0.4) # Probability that x<0.4 is 0.5.
q(N)(.1) # x=0 is the smallest value x such that p(B)(x)>=0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
size(N) # size of this distribution is 1.
size(N) <- 2 # size of this distribution is now 2.



