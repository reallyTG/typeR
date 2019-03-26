library(RiverLoad)


### Name: method5
### Title: Load estimation with time and discharge weighted method
### Aliases: method5
### Keywords: univ

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
met5<-method5(union, 2)
met5.month<-method5(union, 2, "month")
met5.year<-method5(union, 2, "year")



