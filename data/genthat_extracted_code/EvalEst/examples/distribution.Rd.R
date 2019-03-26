library(EvalEst)


### Name: distribution
### Title: Generate distribution plots of Monte Carlo simulations
### Aliases: distribution distribution.default distribution.TSdata
###   distribution.MonteCarloSimulations
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
z <-  MonteCarloSimulations(model)
distribution(z)



