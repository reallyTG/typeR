library(BMT)


### Name: BMTfit.mle
### Title: Maximum Likelihood Fit of the BMT Distribution to Non-censored
###   Data.
### Aliases: BMTfit.mle
### Keywords: distribution

### ** Examples

# (1) basic fit by maximum likelihood estimation
set.seed(1234)
x1 <- rBMT(n=100, p3 = 0.25, p4 = 0.75)
BMTfit.mle(x1)

# (2) how to change the optimisation method?
BMTfit.mle(x1, optim.method="L-BFGS-B") 
BMTfit.mle(x1, custom.optim="nlminb")

# (3) estimation of the tails weights parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mle(x1, start=list(p3=0.5, p4=0.5), fix.arg=list(p1=0, p2=1))

# (4) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mle(x1, start=list(p3=0, p4=0.5), type.p.3.4 = "a-s", 
           fix.arg=list(p1=0, p2=1))




