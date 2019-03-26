library(reportRx)


### Name: etsum
### Title: Get event time summary dataframe
### Aliases: etsum
### Keywords: dataframe

### ** Examples

require(survival)
lung$sex<-factor(lung$sex)
etsum(lung,c("time","status"),"sex")
etsum(lung,c("time","status"))
etsum(lung,c("time","status"),"sex",c(1,2,3))



