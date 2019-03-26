library(cernn)


### Name: select_lambda
### Title: Selection of penalty parameter based on cross-validation
### Aliases: select_lambda

### ** Examples

n <- 30
p <- 30
set.seed(12345)
X <- matrix(rnorm(n*p),n,p)
alpha <- get_alpha(X)
lambda_max <- get_lambda_max(svd(X)$d**2,alpha,n)
lambda <- 10**(seq(-1,log10(lambda_max),length.out=100))
sol_path <- cernn(X,lambda,alpha)
df <- t(sol_path$e)

## Plot regularization paths of eigenvalues
matplot(x=log10(lambda),y=df,type='l',ylab='shrunken eigenvalue')
grand_mean <- (norm(scale(X,center=TRUE,scale=FALSE),'f')**2)/(n*p)
abline(h=grand_mean)

## Plot selected lambda
abline(v=log10(select_lambda(X,lambda)$lambda))



