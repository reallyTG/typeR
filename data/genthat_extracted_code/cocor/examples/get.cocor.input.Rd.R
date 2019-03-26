library(cocor)


### Name: get.cocor.input
### Title: Get input parameters of a cocor result object
### Aliases: get.cocor.input get.cocor.input,-method
###   get.cocor.input,cocor-method
###   get.cocor.input,cocor.dep.groups.nonoverlap-method
###   get.cocor.input,cocor.dep.groups.overlap-method
###   get.cocor.input,cocor.indep.groups-method

### ** Examples

data("aptitude")

cocor.result <- cocor(~knowledge + intelligence.a | logic + intelligence.a,
      aptitude$sample1)
get.cocor.input(cocor.result)




