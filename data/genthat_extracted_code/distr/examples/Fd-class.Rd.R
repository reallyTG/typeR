library(distr)


### Name: Fd-class
### Title: Class "Fd"
### Aliases: Fd-class Fd initialize,Fd-method
### Keywords: distribution

### ** Examples

F <- Fd(df1 = 1, df2 = 1) # F is a F distribution with df=1 and df2=1.
r(F)(1) # one random number generated from this distribution, e.g. 29.37863
d(F)(1) # Density of this distribution is 0.1591549 for x=1 .
p(F)(1) # Probability that x<1 is 0.5.
q(F)(.1) # Probability that x<0.02508563 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
df1(F) # df1 of this distribution is 1.
df1(F) <- 2 # df1 of this distribution is now 2.
Fn <- Fd(df1 = 1, df2 = 1, ncp = 0.5) 
  # Fn is a F distribution with df=1, df2=1 and ncp =0.5.
d(Fn)(1) ## from R 2.3.0 on ncp no longer ignored...



