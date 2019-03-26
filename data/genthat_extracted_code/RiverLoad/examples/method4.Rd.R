library(RiverLoad)


### Name: method4
### Title: Load estimation with time-weighted concentration method
### Aliases: method4
### Keywords: univ

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
met4<-method4(union, 2)
met4.month<-method4(union, 2, "month")
met4.year<-method4(union, 2, "year")



