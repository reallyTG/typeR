library(reportRx)


### Name: plotkm
### Title: Plot KM curve
### Aliases: plotkm
### Keywords: plot

### ** Examples

require(survival)
lung$sex<-factor(lung$sex)
plotkm(lung,c("time","status"))
plotkm(lung,c("time","status"),"sex")



