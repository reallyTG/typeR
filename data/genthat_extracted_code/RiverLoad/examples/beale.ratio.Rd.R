library(RiverLoad)


### Name: beale.ratio
### Title: Load estimation with Beale ratio method
### Aliases: beale.ratio
### Keywords: univ

### ** Examples

data("flow.data1", "conc.data1")
union<-db.union(flow.data1, conc.data1)
beale<-beale.ratio(union, 2)
beale.month<-beale.ratio(union, 2, "month")
beale.year<-beale.ratio(union, 2, "year")



