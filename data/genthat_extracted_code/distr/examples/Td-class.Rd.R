library(distr)


### Name: Td-class
### Title: Class "Td"
### Aliases: Td-class Td initialize,Td-method
### Keywords: distribution

### ** Examples

T <- Td(df = 1) # T is a t distribution with df = 1.
r(T)(1) # one random number generated from this distribution, e.g. -0.09697573
d(T)(1) # Density of this distribution is 0.1591549 for x = 1.
p(T)(1) # Probability that x < 1 is 0.75.
q(T)(.1) # Probability that x < -3.077684 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
df(T) # df of this distribution is 1.
df(T) <- 2 # df of this distribution is now 2.
Tn <- Td(df = 1, ncp = 5) 
  # T is a noncentral t distribution with df = 1 and ncp = 5.
d(Tn)(1) ## from R 2.3.0 on ncp no longer ignored...



