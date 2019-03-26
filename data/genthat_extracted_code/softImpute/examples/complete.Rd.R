library(softImpute)


### Name: complete
### Title: make predictions from an svd object
### Aliases: complete impute complete,Incomplete-method
###   complete,matrix-method
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
fit1=softImpute(xna,rank=50,lambda=30)
complete(xna,fit1)



