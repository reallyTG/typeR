library(MNM)


### Name: affine.trans
### Title: Function For Affine Data Transformation
### Aliases: affine.trans
### Keywords: multivariate

### ** Examples

data(iris)
IRIS <- iris[,1:4]
colMeans(IRIS)
cov(IRIS)
IRIS.trans <- affine.trans(IRIS, solve(cov(IRIS)), colMeans(IRIS),TRUE)
colMeans(IRIS.trans)
cov(IRIS.trans)



