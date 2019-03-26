library(ADMM)


### Name: admm.bp
### Title: Basis Pursuit
### Aliases: admm.bp

### ** Examples

## generate sample data
n = 30;
m = 10;
A = matrix(rnorm(n*m), nrow=m);

x = matrix(rep(0,n))
x[c(3,6,21),] = rnorm(3)
b = A%*%x

## run example
output = admm.bp(A, b)

## report convergence plot
niter  = length(output$history$s_norm)
par(mfrow=c(1,3))
plot(1:niter, output$history$objval, "b", main="cost function")
plot(1:niter, output$history$r_norm, "b", main="primal residual")
plot(1:niter, output$history$s_norm, "b", main="dual residual")




