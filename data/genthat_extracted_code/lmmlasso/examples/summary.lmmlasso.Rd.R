library(lmmlasso)


### Name: summary.lmmlasso
### Title: Summarize an lmmlasso object
### Aliases: summary.lmmlasso
### Keywords: methods

### ** Examples

data(classroomStudy)
fit <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
summary(fit)



