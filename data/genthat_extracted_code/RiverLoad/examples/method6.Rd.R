library(RiverLoad)


### Name: method6
### Title: Load estimation based on linear interpolation of concentration
### Aliases: method6
### Keywords: arit

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
met6<-method6(union, 2)
met6.month<-method6(union, 2, "month")
met6.year<-method6(union, 2, "year")



