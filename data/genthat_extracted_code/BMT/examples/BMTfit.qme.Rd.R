library(BMT)


### Name: BMTfit.qme
### Title: Quantile Matching Fit of the BMT Distribution to Non-censored
###   Data.
### Aliases: BMTfit.qme
### Keywords: distribution

### ** Examples

# (1) basic fit by quantile matching estimation
set.seed(1234)
x1 <- rBMT(n=100, p3 = 0.25, p4 = 0.75)
BMTfit.qme(x1)

# (2) changing the probability vector on which quantiles are matched
BMTfit.qme(x1, probs=c(0.1,0.3,0.5,0.75))

# (3) how to change the optimisation method?
BMTfit.qme(x1, optim.method="L-BFGS-B") 
BMTfit.qme(x1, custom.optim="nlminb")

# (4) estimation of the tails weights parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.qme(x1, start=list(p3=0.5, p4=0.5), 
           fix.arg=list(p1=0, p2=1), probs=c(1/3,2/3))

# (5) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.qme(x1, start=list(p3=0, p4=0.5), type.p.3.4 = "a-s", 
           fix.arg=list(p1=0, p2=1), probs=c(1/3,2/3))




