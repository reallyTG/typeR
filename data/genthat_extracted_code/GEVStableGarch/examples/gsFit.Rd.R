library(GEVStableGarch)


### Name: gsFit
### Title: Estimation of ARMA-GARCH/APARCH models
### Aliases: gsFit

### ** Examples

# This examples uses the dem2gbp dataset to estimate
# an ARMA(1,1)-GARCH(1,1) with GEV conditional distribution.
data(dem2gbp)
x = dem2gbp[, 1]
gev.model = gsFit(data = x , formula = ~garch(1,1), cond.dist = "gev")



