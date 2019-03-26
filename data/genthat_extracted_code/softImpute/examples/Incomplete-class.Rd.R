library(softImpute)


### Name: Incomplete-class
### Title: Class '"Incomplete"'
### Aliases: Incomplete-class as.matrix,Incomplete-method
###   coerce,matrix,Incomplete-method coerce,sparseMatrix,Incomplete-method
### Keywords: classes

### ** Examples

showClass("Incomplete")
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



