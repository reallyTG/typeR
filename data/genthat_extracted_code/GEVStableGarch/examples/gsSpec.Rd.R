library(GEVStableGarch)


### Name: gsSpec
### Title: Specification of ARMA-GARCH/APARCH models with GEV or stable
###   distributions
### Aliases: gsSpec
### Keywords: models

### ** Examples


# stable-GARCH from Curto et al. (2009) for the DJIA dataset
spec.stable = gsSpec(model = list(mu = 0.0596, omega = 0.0061, 
alpha = 0.0497, beta = 0.9325, skew = -0.9516, shape = 1.9252), 
cond.dist = "stableS1")
sim.stable = gsSim(spec = spec.stable, n = 1000)
 
# GEV-GARCH model from Zhao et al. (2011)
spec.gev = gsSpec(model = list(mu = 0.21, a = 0.32, omega = 0.01,
alpha = 0.45, beta = 0.08, shape = 0.08), cond.dist = "gev")
sim.gev = gsSim(spec = spec.gev, n = 1000)




