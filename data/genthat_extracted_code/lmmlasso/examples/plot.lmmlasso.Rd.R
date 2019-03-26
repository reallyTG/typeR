library(lmmlasso)


### Name: plot.lmmlasso
### Title: Diagnostic Plots for a lmmlasso object
### Aliases: plot.lmmlasso
### Keywords: hplot

### ** Examples

data(classroomStudy)
fit <- lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
plot(fit)



