library(YPmodel)


### Name: YPmodel
### Title: A main function of package of model of short-term and long-term
###   hazard ratio for survival data
### Aliases: YPmodel YPmodel.default plot.YPmodel print.YPmodel
###   summary.YPmodel
### Keywords: YPmodel

### ** Examples

library(YPmodel)
data(gastric)
result <- YPmodel(gastric, repNum=100)
summary(result)
plot(result)



