library(Funclustering)


### Name: plotOC
### Title: plot Original Curves
### Aliases: plotOC

### ** Examples

data(growth)
curves=matrix(data=cbind(growth$hgtm,growth$hgtf),ncol=93)
time=growth$age
plotOC(time,curves)



