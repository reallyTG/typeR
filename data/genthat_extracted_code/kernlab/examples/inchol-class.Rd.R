library(kernlab)


### Name: inchol-class
### Title: Class "inchol"
### Aliases: inchol-class diagresidues maxresiduals pivots
###   diagresidues,inchol-method maxresiduals,inchol-method
###   pivots,inchol-method
### Keywords: classes

### ** Examples

data(iris)
datamatrix <- as.matrix(iris[,-5])
# initialize kernel function
rbf <- rbfdot(sigma=0.1)
rbf
Z <- inchol(datamatrix,kernel=rbf)
dim(Z)
pivots(Z)
diagresidues(Z)
maxresiduals(Z)



