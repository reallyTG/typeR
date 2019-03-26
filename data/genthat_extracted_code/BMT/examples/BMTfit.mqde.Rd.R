library(BMT)


### Name: BMTfit.mqde
### Title: Minimum Quantile Distance Fit of the BMT Distribution to
###   Non-censored Data.
### Aliases: BMTfit.mqde
### Keywords: distribution

### ** Examples

# (1) basic fit by minimum quantile distance estimation
set.seed(1234)
x1 <- rBMT(n=100, p3=0.25, p4=0.75)
BMTfit.mqde(x1)

# (2) quantile matching is a particular case of minimum quantile distance
BMTfit.mqde(x1, probs=c(0.2,0.4,0.6,0.8), qtype=7)

# (3) maximum or manhattan instead of euclidean distance
BMTfit.mqde(x1, dist="maximum")
BMTfit.mqde(x1, dist="manhattan")

# (4) how to change the optimisation method?
BMTfit.mqde(x1, optim.method="L-BFGS-B") 
BMTfit.mqde(x1, custom.optim="nlminb")

# (5) estimation of the tails weights parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mqde(x1, start=list(p3=0.5, p4=0.5), fix.arg=list(p1=0, p2=1))

# (6) estimation of the asymmetry-steepness parameters of the BMT 
# distribution with domain fixed at [0,1]
BMTfit.mqde(x1, start=list(p3=0, p4=0.5), type.p.3.4 = "a-s", 
            fix.arg=list(p1=0, p2=1))




