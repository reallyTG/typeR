library(RiverLoad)


### Name: CQregression
### Title: Relationship between concentration and flow
### Aliases: CQregression
### Keywords: regression

### ** Examples

data("flow.data1","conc.data1")
union<-db.union(flow.data1, conc.data1)
reg.relationship<-CQregression(union, 2)



