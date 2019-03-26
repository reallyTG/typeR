library(sensitivity)


### Name: PoincareOptimal
### Title: Optimal Poincare constants for Derivative-based Global
###   Sensitivity Measures (DGSM)
### Aliases: PoincareOptimal

### ** Examples



# uniform [0,1]
out <- PoincareOptimal(distr=list("unif",0,1))
print(out$opt)

# truncated standard normal on [-1, 1]
out <- PoincareOptimal(distr=dnorm, min=-1, max=1, plot=TRUE, only.values=FALSE)
print(out$opt)

## No test: 
# truncated standard normal on [-1.87, +infty]
out <- PoincareOptimal(distr=list("norm",0,1), min=-1.87, max=5, method="integral", n=500)
print(out$opt)

# truncated Gumbel(0,1) on [-0.92, 3.56]
library(evd)
out <- PoincareOptimal(distr=list("gumbel",0,1), min=-0.92, max=3.56, method="integral", n=500)
print(out$opt)

# symetric triangular [-1,1]
library(triangle)
out <- PoincareOptimal(distr=list("triangle",-1,1,0), min=NULL, max=NULL)
print(out$opt)

# Lognormal distribution
out <- PoincareOptimal(distr=list("lognorm",1,2), min=3, max=10, only.values=FALSE,plot=TRUE, 
  method="integral")
print(out$opt)

## End(No test)




