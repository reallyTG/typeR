library(compound.Cox)


### Name: uni.score
### Title: Univariate Cox score test
### Aliases: uni.score
### Keywords: univariate Cox regression score test compound covariate
###   feature selection

### ** Examples

data(Lung)
t.vec=Lung$t.vec[Lung$train==TRUE]
d.vec=Lung$d.vec[Lung$train==TRUE]
X.mat=Lung[Lung$train==TRUE,-c(1,2,3)]
uni.score(t.vec, d.vec, X.mat)



