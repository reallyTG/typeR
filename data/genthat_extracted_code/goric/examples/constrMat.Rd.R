library(goric)


### Name: constrMat
### Title: Generate Constraint Matrices
### Aliases: constrMat
### Keywords: misc

### ** Examples

n <- c(10,20,30,40)
constrMat(n, type="monotone")
constrMat(n, type="control", base=2)
constrMat(n, type="average")
constrMat(n, type="laverage")
constrMat(n, type="uaverage")
constrMat(n, type="caverage", base=2)



