library(RiverLoad)


### Name: rating.period
### Title: Load estimation with log log rating curve based on monthly or
###   annual relationship
### Aliases: rating.period
### Keywords: regression

### ** Examples

data("flow.data2","conc.data2")
union<-db.union(flow.data2, conc.data1)
reg.periodM<-rating.period(union, 1, "month")
reg.periodY<-rating.period(union, 1, "year")



