library(BMT)


### Name: BMTfit.mme
### Title: Moment Matching Fit of the BMT Distribution to Non-censored
###   Data.
### Aliases: BMTfit.mme
### Keywords: distribution

### ** Examples

# (1) basic fit by moment matching estimation
set.seed(1234)
x1 <- rBMT(n=100, p3=0.25, p4=0.75)
BMTfit.mme(x1)

# (3) how to change the optimisation method?
BMTfit.mme(x1, optim.method="L-BFGS-B") 
BMTfit.mme(x1, custom.optim="nlminb")

# (4) estimation of the tails weights parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mme(x1, start=list(p3=0.5, p4=0.5), fix.arg=list(p1=0, p2=1))

# (5) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mme(x1, start=list(p3=0, p4=0.5), type.p.3.4 = "a-s", 
           fix.arg=list(p1=0, p2=1))




