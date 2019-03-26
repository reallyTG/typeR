library(chemometrics)


### Name: prm_cv
### Title: Cross-validation for robust PLS
### Aliases: prm_cv
### Keywords: multivariate

### ** Examples

data(cereal)
set.seed(123)
res <- prm_cv(cereal$X,cereal$Y[,1],a=5,segments=4,plot.opt=TRUE)



