library(cornet)


### Name: .test
### Title: Single-split test
### Aliases: .test

### ** Examples

n <- 100; p <- 200
y <- rnorm(n)
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
cornet:::.test(y=y,cutoff=0,X=X)




