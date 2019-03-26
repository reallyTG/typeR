library(compound.Cox)


### Name: uni.selection
### Title: Univariate feature selection based on univariate significance
###   tests
### Aliases: uni.selection
### Keywords: univariate Cox regression compound covariate cross-validated
###   partial likelihood false discovery rate feature selection

### ** Examples

data(Lung)
t.vec=Lung$t.vec[Lung$train==TRUE]
d.vec=Lung$d.vec[Lung$train==TRUE]
X.mat=Lung[Lung$train==TRUE,-c(1,2,3)]
uni.selection(t.vec, d.vec, X.mat, P.value=0.05,K=5,score=FALSE)
## the outputs reproduce Table 3 of Emura and Chen (2016) ## 



