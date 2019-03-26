library(rr)


### Name: rrreg.predictor
### Title: Randomized Response as a Regression Predictor
### Aliases: rrreg.predictor
### Keywords: joint model predictor regression

### ** Examples


data(nigeria)

## Define design parameters

set.seed(44)

p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

## Fit joint model of responses to an outcome regression of joining a civic 
## group and the randomized response item of having a militant social connection
## Not run: 
##D rr.q1.pred.obj <- 
##D     rrreg.predictor(civic ~ cov.asset.index + cov.married + I(cov.age/10) + 
##D               I((cov.age/10)^2) + cov.education + cov.female 
##D               + rr.q1, rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
##D               data = nigeria, verbose = FALSE, optim = TRUE,
##D               p = p, p1 = p1, p0 = p0, design = "forced-known")
##D 
##D summary(rr.q1.pred.obj)
## End(Not run)
## Replicates Table 4 in Blair, Imai, and Zhou (2014)




