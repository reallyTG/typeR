library(cornet)


### Name: print.cornet
### Title: Combined regression
### Aliases: print.cornet

### ** Examples

n <- 100; p <- 200
y <- rnorm(n)
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
net <- cornet(y=y,cutoff=0,X=X)
print(net)




