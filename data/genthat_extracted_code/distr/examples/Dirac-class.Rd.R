library(distr)


### Name: Dirac-class
### Title: Class "Dirac"
### Aliases: Dirac-class Dirac initialize,Dirac-method log,Dirac-method
###   Math,Dirac-method
### Keywords: distribution

### ** Examples

D <- Dirac(location = 0) # D is a Dirac distribution with location=0.
r(D)(1)
# r(D)(1) generates a pseudo-random-number according to a Dirac
# distribution with location = 0,
# which of course will take 0 as value almost surely.
d(D)(0) # Density of this distribution is 1 for x = 0.
p(D)(1) # Probability that x < 1 is 1.
q(D)(.1) # q(D)(x) is always 0 (= location).
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
location(D) # location of this distribution is 0.
location(D) <- 2 # location of this distribution is now 2.



