library(RiverLoad)


### Name: ferguson.period
### Title: Load estimation with Ferguson method based on monthly or annual
###   relationship
### Aliases: ferguson.period
### Keywords: regression

### ** Examples

data("flow.data2","conc.data2")
union<-db.union(flow.data2, conc.data2)
fer.periodM<-ferguson.period(union, 1, "month")
fer.periodY<-ferguson.period(union, 1, "year")



