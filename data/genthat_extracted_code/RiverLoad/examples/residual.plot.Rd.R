library(RiverLoad)


### Name: residual.plot
### Title: Residual plots of one selected component
### Aliases: residual.plot
### Keywords: regression dplot

### ** Examples

data("flow.data1","conc.data1")
union<-db.union(flow.data1, conc.data1)
residual.plot(union, 1)



