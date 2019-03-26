library(softImpute)


### Name: svd.als
### Title: compute a low rank soft-thresholded svd by alternating
###   orthogonal ridge regression
### Aliases: svd.als svd.als,sparseMatrix-method
###   svd.als,SparseplusLowRank-method
### Keywords: models array multivariate

### ** Examples

#create a matrix and run the algorithm
set.seed(101)
n=100
p=50
J=25
np=n*p
x=matrix(rnorm(n*J),n,J)%*%matrix(rnorm(J*p),J,p)+matrix(rnorm(np),n,p)/5
fit=svd.als(x,rank=25,lambda=50)
fit$d
pmax(svd(x)$d-50,0)
# now create a sparse matrix and do the same
nnz=trunc(np*.3)
inz=sample(seq(np),nnz,replace=FALSE)
i=row(x)[inz]
j=col(x)[inz]
x=rnorm(nnz)
xS=sparseMatrix(x=x,i=i,j=j)
fit2=svd.als(xS,rank=20,lambda=7)
fit2$d
pmax(svd(as.matrix(xS))$d-7,0)



