library(QuantifQuantile)


### Name: QuantifQuantile.d
### Title: QuantifQuantile for general X
### Aliases: QuantifQuantile.d

### ** Examples

## Not run: 
##D set.seed(644925)
##D n <- 500
##D X <- runif(n,-2,2)
##D Y <- X^2+rnorm(n)
##D x <- seq(min(X),max(X),length=100)
##D res <- QuantifQuantile.d(X,Y,x,testN=seq(15,35,by=5))
## End(Not run)
## Not run: 
##D set.seed(272422)
##D n <- 1000
##D X <- matrix(runif(n*2,-2,2),ncol=n)
##D Y <- apply(X^2,2,sum)+rnorm(n)
##D x1 <- seq(min(X[1,]),max(X[1,]),length=20)
##D x2 <- seq(min(X[2,]),max(X[2,]),length=20)
##D x <- matrix(c(rep(x1,20),sort(rep(x2,20))),nrow=nrow(X),byrow=TRUE)
##D res <- QuantifQuantile.d(X,Y,x,testN=seq(90,140,by=10),B=20,tildeB=15)
## End(Not run)



