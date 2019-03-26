library(FinCovRegularization)


### Name: MacroFactor.Cov
### Title: Covariance Matrix Estimation by Macroeconomic Factor Model
### Aliases: MacroFactor.Cov

### ** Examples

data(m.excess.c10sp9003)
assets <- m.excess.c10sp9003[,1:10]
factor <- m.excess.c10sp9003[,11]
MacroFactor.Cov(assets, factor)



