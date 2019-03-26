library(cornet)


### Name: plot.cornet
### Title: Plot loss matrix
### Aliases: plot.cornet

### ** Examples

n <- 100; p <- 200
y <- rnorm(n)
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
net <- cornet(y=y,cutoff=0,X=X)
plot(net)




