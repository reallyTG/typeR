library(ADMM)


### Name: admm.lasso
### Title: Least Absolute Shrinkage and Selection Operator
### Aliases: admm.lasso

### ** Examples

## Not run: 
##D ## generate sample data
##D m = 50
##D n = 100
##D p = 0.1   # percentange of non-zero elements
##D 
##D x0 = matrix(Matrix::rsparsematrix(n,1,p))
##D A  = matrix(rnorm(m*n),nrow=m)
##D for (i in 1:ncol(A)){
##D   A[,i] = A[,i]/sqrt(sum(A[,i]*A[,i]))
##D }
##D b = A%*%x0 + sqrt(0.001)*matrix(rnorm(m))
##D 
##D ## set regularization lambda value
##D lambda = 0.1*Matrix::norm(t(A)%*%b, 'I')
##D 
##D ## run example
##D output = admm.lasso(A, b, lambda)
##D 
##D ## report convergence plot
##D niter  = length(output$history$s_norm)
##D par(mfrow=c(1,3))
##D plot(1:niter, output$history$objval, "b", main="cost function")
##D plot(1:niter, output$history$r_norm, "b", main="primal residual")
##D plot(1:niter, output$history$s_norm, "b", main="dual residual")
## End(Not run)




