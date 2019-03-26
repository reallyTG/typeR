library(MNM)


### Name: mv.shape.est
### Title: Shape Matrices
### Aliases: mv.shape.est
### Keywords: multivariate nonparametric

### ** Examples

data(iris)
IRIS <- iris[,1:4]
mv.shape.est(IRIS, "sign")
mv.shape.est(IRIS, "symmsign", "o")
mv.shape.est(IRIS, "rank")



