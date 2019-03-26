library(RiverLoad)


### Name: method2
### Title: Load estimation with discharge-weighted concentration method
### Aliases: method2
### Keywords: univ

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
met2<-method2(union, 2)
met2.month<-method2(union, 2, "month")
met2.year<-method2(union, 2, "year")



