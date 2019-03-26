library(EvalEst)


### Name: tfplot.MonteCarloSimulations
### Title: Generate plots of Monte Carlo simulations
### Aliases: tfplot.MonteCarloSimulations
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
z <-  MonteCarloSimulations(model)
tfplot(z)



