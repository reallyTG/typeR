library(cernn)


### Name: loss_quadratic
### Title: Quadratic Loss
### Aliases: loss_quadratic

### ** Examples

set.seed(12345)
p <- 20
d <- sort(abs(rcauchy(p)),decreasing=TRUE)
sigma <- diag(d)
n <- 20
X <- scale(matrix(rnorm(n*p),n,p),center=FALSE,scale=1/sqrt(d))
alpha <- get_alpha(X)
lambda <- 10**(seq(-2,2,length.out=100))
sol_cv <- select_lambda(X,lambda)
loss_quadratic(sol_cv$S,solve(sigma))



