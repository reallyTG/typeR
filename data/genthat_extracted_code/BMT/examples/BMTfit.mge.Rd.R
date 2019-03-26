library(BMT)


### Name: BMTfit.mge
### Title: Maximum Goodness-of-fit Fit of the BMT Distribution to
###   Non-censored Data.
### Aliases: BMTfit.mge
### Keywords: distribution

### ** Examples

# (1) basic fit by maximum goodness-of-fit estimation
set.seed(1234)
x1 <- rBMT(n=100, p3 = 0.25, p4 = 0.75)
BMTfit.mge(x1)

# (2) how to change the goodness-of-fit statistic/distance?
BMTfit.mge(x1, gof="KS")
BMTfit.mge(x1, gof="AD2R")

# (3) how to change the optimisation method?
BMTfit.mge(x1, optim.method="L-BFGS-B") 
BMTfit.mge(x1, custom.optim="nlminb")

# (4) estimation of the tails weights parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mge(x1, start=list(p3=0.5, p4=0.5), fix.arg=list(p1=0, p2=1))

# (5) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mge(x1, start=list(p3=0, p4=0.5), type.p.3.4 = "a-s", 
           fix.arg=list(p1=0, p2=1))




