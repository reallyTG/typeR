library(smoothtail)


### Name: generalizedPick
### Title: Compute generalized Pickand's estimator
### Aliases: generalizedPick
### Keywords: distribution htest nonparametric

### ** Examples

# generate ordered random sample from GPD
set.seed(1977)
n <- 20
gam <- -0.75
x <- rgpd(n, gam)

## generate dlc object
est <- logConDens(x, smoothed = FALSE, print = FALSE, gam = NULL, xs = NULL)

# compute tail index estimators
generalizedPick(est, c = 0.75, gam0 = -1/3)



