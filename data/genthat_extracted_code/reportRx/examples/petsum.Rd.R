library(reportRx)


### Name: petsum
### Title: Print LaTeX event time summary
### Aliases: petsum
### Keywords: print

### ** Examples

require(survival)
lung$sex<-factor(lung$sex)
petsum(lung,c("time","status"),"sex")
petsum(lung,c("time","status"))
petsum(lung,c("time","status"),"sex",c(1,2,3),"months")



