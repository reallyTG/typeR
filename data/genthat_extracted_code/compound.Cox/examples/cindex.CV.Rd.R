library(compound.Cox)


### Name: cindex.CV
### Title: Cross-validated c-index for measuring the predictive accuracy of
###   a prognostic index under a copula-based dependent censoring model.
### Aliases: cindex.CV
### Keywords: cross-validation copula c-index

### ** Examples


n=25 ### sample size ###
p=3  ### the number of covariates ###
set.seed(1)
T=rexp(n) ### survival time
U=rexp(n) ### censoring time
t.vec=pmin(T,U) ### minimum of survival time and censoring time
d.vec=as.numeric( c(T<=U) ) ### censoring indicator
X.mat=matrix(runif(n*p),n,p) ### covariates matrix

cindex.CV(t.vec,d.vec,X.mat,alpha=2) ### alpha=2 corresponds to Kendall's tau=0.5




