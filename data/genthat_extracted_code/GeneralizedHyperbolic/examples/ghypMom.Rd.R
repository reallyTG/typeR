library(GeneralizedHyperbolic)


### Name: ghypMom
### Title: Calculate Moments of the Generalized Hyperbolic Distribution
### Aliases: ghypMom
### Keywords: distribution

### ** Examples

param <- c(1, 2, 2, 1, 2)
mu <- param[1]
### mu moments
m1 <- ghypMean(param = param)
m1 - mu
ghypMom(1, param = param, momType = "mu")

## Comparison, using momIntegrated from pkg 'DistributionUtils':
momIntegrated <- DistributionUtils :: momIntegrated

momIntegrated("ghyp", order = 1, param = param, about = mu)
ghypMom(2, param = param, momType = "mu")
momIntegrated("ghyp", order = 2, param = param, about = mu)
ghypMom(10, param = param, momType = "mu")
momIntegrated("ghyp", order = 10, param = param, about = mu)

### raw moments
ghypMean(param = param)
ghypMom(1, param = param, momType = "raw")
momIntegrated("ghyp", order = 1, param = param, about = 0)
ghypMom(2, param = param, momType = "raw")
momIntegrated("ghyp", order = 2, param = param, about = 0)
ghypMom(10, param = param, momType = "raw")
momIntegrated("ghyp", order = 10, param = param, about = 0)

### central moments
ghypMom(1, param = param, momType = "central")
momIntegrated("ghyp", order = 1, param = param, about = m1)
ghypVar(param = param)
ghypMom(2, param = param, momType = "central")
momIntegrated("ghyp", order = 2, param = param, about = m1)
ghypMom(10, param = param, momType = "central")
momIntegrated("ghyp", order = 10, param = param, about = m1)



