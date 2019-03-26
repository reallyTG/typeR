library(smoothtail)


### Name: falkMVUE
### Title: Compute original and smoothed version of Falk's estimator for a
###   known endpoint
### Aliases: falkMVUE
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
omega <- -1 / gam
falkMVUE(est, omega)



