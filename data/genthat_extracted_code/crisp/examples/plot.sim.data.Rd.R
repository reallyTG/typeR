library(crisp)


### Name: plot.sim.data
### Title: Plot Mean Model for Data.
### Aliases: plot.sim.data

### ** Examples

#See ?'crisp-package' for a full example of how to use this package

#generate data (using a very small 'n' for illustration purposes)
set.seed(1)
data <- sim.data(n = 15, scenario = 2)

#plot the mean model for the scenario from which we generated data
plot(data)



