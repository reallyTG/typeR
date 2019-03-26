library(RiverLoad)


### Name: beale.period
### Title: Load estimation with Beale ratio estimator based on monthly or
###   annual relationship
### Aliases: beale.period
### Keywords: univ

### ** Examples

data("flow.data1","conc.data1")
union<-db.union(flow.data1, conc.data1)
beale.periodM<-beale.period(union, 2, "month")
beale.periodY<-beale.period(union, 2, "year")



