library(BayesMed)


### Name: jzs_partcorSD
### Title: A default Bayesian hypothesis test for partial correlation using
###   the Savage-Dickey method.
### Aliases: jzs_partcorSD

### ** Examples

# simulate partially correlated data
X <- rnorm(50,0,1)
C <- .5*X + rnorm(50,0,1)
Y <- .3*X + .6*C + rnorm(50,0,1)

# run jzs_partcor
(res <- jzs_partcorSD(X,Y,C))

# plot posterior samples
plot(res$beta_samples)

# plot traceplot
plot(res$jagssamples)
# where the first chain (theta[1]) is for tau' and the second chain (theta[2]) for beta



