library(EvalEst)


### Name: MonteCarloSimulations
### Title: Generate simulations
### Aliases: MonteCarloSimulations MonteCarloSimulations.default
###   MonteCarloSimulations.TSmodel MonteCarloSimulations.TSestModel
###   MonteCarloSimulations.EstEval
###   MonteCarloSimulations.MonteCarloSimulations is.MonteCarloSimulations
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
z <-  MonteCarloSimulations(model, simulation.args=list(sampleT=100))
tfplot(z)
distribution(z)



