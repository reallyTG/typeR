library(ADMM)


### Name: admm.genlasso
### Title: Generalized LASSO
### Aliases: admm.genlasso

### ** Examples

## generate sample data
m = 100
n = 200
p = 0.1   # percentange of non-zero elements

x0 = matrix(Matrix::rsparsematrix(n,1,p))
A  = matrix(rnorm(m*n),nrow=m)
for (i in 1:ncol(A)){
  A[,i] = A[,i]/sqrt(sum(A[,i]*A[,i]))
}
b = A%*%x0 + sqrt(0.001)*matrix(rnorm(m))
D = diag(n);

## set regularization lambda value
regval = 0.1*Matrix::norm(t(A)%*%b, 'I')

## solve LASSO via reducing from Generalized LASSO
output = admm.genlasso(A,b,D,lambda=regval) # set D as identity matrix

## visualize
## report convergence plot
niter  = length(output$history$s_norm)
par(mfrow=c(1,3))
plot(1:niter, output$history$objval, "b", main="cost function")
plot(1:niter, output$history$r_norm, "b", main="primal residual")
plot(1:niter, output$history$s_norm, "b", main="dual residual")




