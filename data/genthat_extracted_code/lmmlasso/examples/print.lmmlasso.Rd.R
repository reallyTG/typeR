library(lmmlasso)


### Name: print.lmmlasso
### Title: Print a short summary of a lmmlasso object.
### Aliases: print.lmmlasso

### ** Examples

data(classroomStudy)
fit <-
lmmlasso(x=classroomStudy$X,y=classroomStudy$y,z=classroomStudy$Z,
grp=classroomStudy$grp,lambda=15,pdMat="pdIdent")
print(fit)



