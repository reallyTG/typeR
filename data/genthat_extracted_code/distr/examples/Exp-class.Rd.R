library(distr)


### Name: Exp-class
### Title: Class "Exp"
### Aliases: Exp-class Exp initialize,Exp-method
### Keywords: distribution

### ** Examples

E <- Exp(rate = 1) # E is a exp distribution with rate = 1.
r(E)(1) # one random number generated from this distribution, e.g. 0.4190765
d(E)(1) # Density of this distribution is 0.3678794 for x = 1.
p(E)(1) # Probability that x < 1 is 0.6321206.
q(E)(.1) # Probability that x < 0.1053605 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
rate(E) # rate of this distribution is 1.
rate(E) <- 2 # rate of this distribution is now 2.
is(E, "Gammad") # yes
as(E,"Gammad")
is(E, "Weibull") 
E+E+E ###  a Gammad -distribution
2*E+Gammad(scale=1)



