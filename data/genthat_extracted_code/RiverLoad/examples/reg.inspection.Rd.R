library(RiverLoad)


### Name: reg.inspection
### Title: Parameters of regression analysis between flow and concentration
### Aliases: reg.inspection
### Keywords: regression

### ** Examples

data("flow.data3", "conc.data3")
union<-db.union(flow.data3, conc.data3)
reg.parametrs<-reg.inspection(union, 1)



