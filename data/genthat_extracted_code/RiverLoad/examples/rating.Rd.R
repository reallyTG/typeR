library(RiverLoad)


### Name: rating
### Title: Load estimation with log log rating curve
### Aliases: rating
### Keywords: regression

### ** Examples

data("flow.data1","conc.data1")
union<-db.union(flow.data1, conc.data1)
CQregression(union,1)
reg<-rating(union, 2)
reg.month<-rating(union, 2, "month")
reg.year<-rating(union, 2, "year")



