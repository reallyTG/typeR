library(RiverLoad)


### Name: method1
### Title: Load estimation with time-weighted flow and concentration method
### Aliases: method1
### Keywords: univ

### ** Examples

data("flow.data1","conc.data1")
union<-db.union(flow.data1, conc.data1)
met1<-method1(union, 2)
met1.month<-method1(union, 2, "month")
met1.year<-method1(union, 2, "year")



