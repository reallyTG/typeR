library(QuantifQuantile)


### Name: QuantifQuantile.d2
### Title: QuantifQuantile for X bivariate
### Aliases: QuantifQuantile.d2

### ** Examples

## Not run: 
##D #(a few seconds to execute)
##D set.seed(164964)
##D n <- 1000
##D X <- matrix(runif(n*2,-2,2),ncol=n)
##D Y <- apply(X^2,2,sum)+rnorm(n)
##D res <- QuantifQuantile.d2(X,Y,testN=seq(90,140,by=10),B=20,tildeB=15)
##D res2 <- QuantifQuantile.d2(X,Y,testN=seq(90,150,by=10),B=20,tildeB=15,same_N=FALSE)
## End(Not run)



