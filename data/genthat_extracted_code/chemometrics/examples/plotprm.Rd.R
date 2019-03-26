library(chemometrics)


### Name: plotprm
### Title: Plot results from robust PLS
### Aliases: plotprm
### Keywords: multivariate

### ** Examples

data(cereal)
set.seed(123)
res <- prm_cv(cereal$X,cereal$Y[,1],a=5,segments=4,plot.opt=FALSE)
plotprm(res,cereal$Y[,1])



