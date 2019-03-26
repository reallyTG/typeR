library(QuantifQuantile)


### Name: QuantifQuantile
### Title: QuantifQuantile for X univariate
### Aliases: QuantifQuantile

### ** Examples

set.seed(644972)
n <- 300
X <- runif(300,-2,2)
Y <- X^2+rnorm(n)
res <- QuantifQuantile(X,Y,testN=seq(10,25,by=5))
## Not run: 
##D res2 <- QuantifQuantile(X,Y,testN=seq(10,30,by=5),same_N=FALSE)
##D 
##D data(gironde)
##D X <- gironde[[1]]$middleemp
##D Y <- gironde[[2]]$density
##D set.seed(642536)
##D res <- QuantifQuantile(X,Y,testN=seq(5,25,by=5))
## End(Not run)



