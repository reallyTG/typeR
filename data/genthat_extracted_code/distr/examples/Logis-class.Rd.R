library(distr)


### Name: Logis-class
### Title: Class "Logis"
### Aliases: Logis-class Logis initialize,Logis-method
### Keywords: distribution

### ** Examples

L <- Logis(location = 1,scale = 1)
# L is a logistic distribution with  location = 1 and scale = 1.
r(L)(1) # one random number generated from this distribution, e.g. 5.87557
d(L)(1) # Density of this distribution is 0.25 for x = 1.
p(L)(1) # Probability that x < 1 is 0.5.
q(L)(.1) # Probability that x < -1.197225 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
location(L) # location of this distribution is 1.
location(L) <- 2 # location of this distribution is now 2.



