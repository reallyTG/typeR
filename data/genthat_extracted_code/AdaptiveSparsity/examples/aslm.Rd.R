library(AdaptiveSparsity)


### Name: aslm
### Title: Adaptive Sparse Linear Model
### Aliases: aslm getSparseModel aslm.formula aslm.default
### Keywords: classes models multivariate

### ** Examples

s = aslm(Infant.Mortality~.,data=swiss)
m = getSparseModel(s)

summary(s)
coef(m)



