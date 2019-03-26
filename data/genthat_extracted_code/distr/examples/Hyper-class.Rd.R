library(distr)


### Name: Hyper-class
### Title: Class "Hyper"
### Aliases: Hyper-class Hyper initialize,Hyper-method
### Keywords: distribution

### ** Examples

H <- Hyper(m=3,n=3,k=3) # H is a hypergeometric distribution with m=3,n=3,k=3.
r(H)(1) # one random number generated from this distribution, e.g. 2
d(H)(1) # Density of this distribution is  0.45 for x=1.
p(H)(1) # Probability that x<1 is 0.5.
q(H)(.1) # x=1 is the smallest value x such that p(H)(x)>=0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
m(H) # m of this distribution is 3.
m(H) <- 2 # m of this distribution is now 2.



