library(clusterSim)


### Name: interval_normalization
### Title: Types of normalization formulas for interval-valued symbolic
###   variables
### Aliases: interval_normalization
### Keywords: interval-valued data normalization symbolic data analysis

### ** Examples

library(clusterSim)
data(data_symbolic_interval_polish_voivodships)
n<-interval_normalization(data_symbolic_interval_polish_voivodships,dataType="simple",type="n2")
plotInterval(n$simple)



