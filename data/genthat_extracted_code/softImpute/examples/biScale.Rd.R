library(softImpute)


### Name: biScale
### Title: standardize a matrix to have optionally row means zero and
###   variances one, and/or column means zero and variances one.
### Aliases: biScale
### Keywords: models array multivariate

### ** Examples

set.seed(101)
n=200
p=100
J=50
np=n*p
missfrac=0.3
x=matrix(rnorm(n*J),n,J)%*%matrix(rnorm(J*p),J,p)+matrix(rnorm(np),n,p)/5
xc=biScale(x)
ix=seq(np)
imiss=sample(ix,np*missfrac,replace=FALSE)
xna=x
xna[imiss]=NA
xnab=biScale(xna,row.scale=FALSE,trace=TRUE)
xnaC=as(xna,"Incomplete")
xnaCb=biScale(xnaC)
nnz=trunc(np*.3)
inz=sample(seq(np),nnz,replace=FALSE)
i=row(x)[inz]
j=col(x)[inz]
x=rnorm(nnz)
xS=sparseMatrix(x=x,i=i,j=j)
xSb=biScale(xS)
class(xSb)



