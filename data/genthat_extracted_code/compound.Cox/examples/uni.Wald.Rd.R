library(compound.Cox)


### Name: uni.Wald
### Title: Univariate Cox Wald test
### Aliases: uni.Wald
### Keywords: univariate Cox regression Wald test compound covariate
###   feature selection

### ** Examples

data(Lung)
t.vec=Lung$t.vec[Lung$train==TRUE]
d.vec=Lung$d.vec[Lung$train==TRUE]
X.mat=Lung[Lung$train==TRUE,-c(1,2,3)]
uni.Wald(t.vec, d.vec, X.mat)



