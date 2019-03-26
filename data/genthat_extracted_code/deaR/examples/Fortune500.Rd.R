library(deaR)


### Name: Fortune500
### Title: Data: Zhu (2014).
### Aliases: Fortune500
### Keywords: datasets

### ** Examples

data("Fortune500")
data_Fortune <- read_data(datadea = Fortune500,
                          dmus = 1,
                          inputs = 2:4,
                          outputs = 5:6)
result <- model_multiplier(data_Fortune,
                           epsilon=0.000001,
                           orientation="io",
                           rts="crs")
# results for General Motors and Ford Motor are not shown
# by deaR because the solution is infeasible
efficiencies(result)
multipliers(result)




