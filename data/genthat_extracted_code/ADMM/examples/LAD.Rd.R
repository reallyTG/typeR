library(ADMM)


### Name: admm.lad
### Title: Least Absolute Deviations
### Aliases: admm.lad

### ** Examples

## Not run: 
##D ## generate data
##D m = 1000
##D n = 100
##D A = matrix(rnorm(m*n),nrow=m)
##D x = 10*matrix(rnorm(n))
##D b = A%*%x
##D 
##D ## add impulsive noise to 10% of positions
##D idx = sample(1:m, round(m/10))
##D b[idx] = b[idx] + 100*rnorm(length(idx))
##D 
##D ## run the code
##D output = admm.lad(A,b)
##D 
##D ## report convergence plot
##D niter  = length(output$history$s_norm)
##D par(mfrow=c(1,3))
##D plot(1:niter, output$history$objval, "b", main="cost function")
##D plot(1:niter, output$history$r_norm, "b", main="primal residual")
##D plot(1:niter, output$history$s_norm, "b", main="dual residual")
## End(Not run)





