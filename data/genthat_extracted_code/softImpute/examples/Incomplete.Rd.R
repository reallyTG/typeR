library(softImpute)


### Name: Incomplete
### Title: create a matrix of class 'Incomplete'
### Aliases: Incomplete coerce,matrix-method
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
xnaC=as(xna,"Incomplete")
### here we do it a different way to demonstrate Incomplete
### In practise the observed values are stored in this market-matrix format.
i = row(xna)[-imiss]
j = col(xna)[-imiss]
xnaC=Incomplete(i,j,x=x[-imiss])
  


