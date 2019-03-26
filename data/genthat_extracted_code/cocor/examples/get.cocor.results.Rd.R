library(cocor)


### Name: get.cocor.results
### Title: Get result parameters of a cocor result object
### Aliases: get.cocor.results get.cocor.results,-method
###   get.cocor.results,cocor-method
###   get.cocor.results,cocor.dep.groups.nonoverlap-method
###   get.cocor.results,cocor.dep.groups.overlap-method
###   get.cocor.results,cocor.indep.groups-method

### ** Examples

data("aptitude")

cocor.result <- cocor(~knowledge + intelligence.a | logic + intelligence.a,
      aptitude$sample1)
get.cocor.results(cocor.result)




