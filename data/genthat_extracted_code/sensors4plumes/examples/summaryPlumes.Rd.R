library(sensors4plumes)


### Name: summaryPlumes
### Title: Summarise values of Simulations by plumes
### Aliases: summaryPlumes weightedMean

### ** Examples

data(radioactivePlumes) 
# sample of locations, e.g. proposed sensor set
locSample = sample.int(nLocations(radioactivePlumes), 10) 

# plume detection 
# (number of plumes not detected at any of locSample at a level of more than 1e-7)
plumeMin_radioactivePlumes = 
  summaryPlumes(radioactivePlumes, locations = locSample, kinds = 2, 
  fun = "min",
  summaryFun = function(x, weight = 1, na.rm = TRUE){sum(x < 1e-7)})



