library(softImpute)


### Name: lambda0
### Title: compute the smallest value for 'lambda' such that
###   'softImpute(x,lambda)' returns the zero solution.
### Aliases: lambda0 lambda0,Incomplete-method
###   lambda0,SparseplusLowRank-method lambda0,sparseMatrix-method
### Keywords: models array multivariate

### ** Examples

set.seed(101)
n=200
p=100
J=50
np=n*p
missfrac=0.3
x=matrix(rnorm(n*J),n,J)%*%matrix(rnorm(J*p),J,p)+matrix(rnorm(np),n,p)/5
ix=seq(np)
imiss=sample(ix,np*missfrac,replace=FALSE)
xna=x
xna[imiss]=NA
lambda0(xna)



