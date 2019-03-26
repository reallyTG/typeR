library(RiverLoad)


### Name: method3
### Title: Load estimation with mean discharge-weighted concentration
###   method
### Aliases: method3
### Keywords: univ

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
met3<-method3(union, 2)
met3.month<-method3(union, 2, "month")
met3.year<-method3(union, 2, "year")



