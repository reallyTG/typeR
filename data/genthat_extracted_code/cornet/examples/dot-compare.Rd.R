library(cornet)


### Name: .compare
### Title: Performance measurement
### Aliases: .compare

### ** Examples

## Don't show: 
n <- 20; p <- 10
y <- rnorm(n)
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
loss <- cornet:::.compare(y=y,cutoff=0,X=X,nfolds=2)
loss
## End(Don't show)
## No test: 
n <- 100; p <- 200
y <- rnorm(n)
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
loss <- cornet:::.compare(y=y,cutoff=0,X=X)
loss
## End(No test)




