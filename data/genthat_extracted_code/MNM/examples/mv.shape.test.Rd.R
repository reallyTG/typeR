library(MNM)


### Name: mv.shape.test
### Title: Test for Sphericity
### Aliases: mv.shape.test
### Keywords: htest multivariate nonparametric

### ** Examples

X <- rmvt(150,diag(1,3))
mv.shape.test(X)
mv.shape.test(X,"sym")



