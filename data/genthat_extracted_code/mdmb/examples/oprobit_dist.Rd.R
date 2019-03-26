library(mdmb)


### Name: oprobit_dist
### Title: Ordinal Probit Models
### Aliases: oprobit_dist doprobit fit_oprobit coef.fit_oprobit
###   logLik.fit_oprobit summary.fit_oprobit vcov.fit_oprobit

### ** Examples

#############################################################################
# EXAMPLE 1: Fit an ordinal probit distribution
#############################################################################

#-- simulate data
set.seed(987)
N <- 1500
# define thresholds
thresh <- c(0,.3, .7, 1.6)
# latent continuous data
yast <- stats::rnorm(N)
# discretized ordinal data
x <- as.numeric( cut( yast, c(-Inf,thresh,Inf) ) ) - 1

#-- fit ordinal probit distribution
mod <- mdmb::fit_oprobit(x=x)
summary(mod)
logLik(mod)
vcov(mod)



