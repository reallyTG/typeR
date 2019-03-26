library(RiverLoad)


### Name: ferguson
### Title: Load estimation with Ferguson rating curve
### Aliases: ferguson
### Keywords: regression

### ** Examples

data("flow.data2", "conc.data2")
union<-db.union(flow.data2, conc.data2)
CQregression(union,1)
ferg<-ferguson(union, 1)
ferg.month<-ferguson(union, 1, "month")
ferg.year<-ferguson(union, 1, "year")



