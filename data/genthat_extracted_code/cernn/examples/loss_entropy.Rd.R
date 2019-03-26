library(cernn)


### Name: loss_entropy
### Title: Entropy Loss
### Aliases: loss_entropy

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
loss_entropy(sol_cv$S,solve(sigma))



