library(distr)


### Name: DExp-class
### Title: Class "DExp"
### Aliases: DExp-class DExp Laplace DoubleExponential
###   initialize,DExp-method
### Keywords: distribution

### ** Examples

D <- DExp(rate = 1) # D is a Laplace distribution with rate = 1.
r(D)(1) # one random number generated from this distribution, e.g. 0.4190765
d(D)(1) # Density of this distribution is 0.1839397 for x = 1.
p(D)(1) # Probability that x < 1 is 0.8160603.
q(D)(.1) # Probability that x < -1.609438 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
rate(D) # rate of this distribution is 1.
rate(D) <- 2 # rate of this distribution is now 2.
3*D ###  still a DExp -distribution



