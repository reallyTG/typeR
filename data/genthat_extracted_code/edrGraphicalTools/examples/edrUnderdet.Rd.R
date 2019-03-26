library(edrGraphicalTools)


### Name: edrUnderdet
### Title: EDR space estimation for underdetermined cases.
### Aliases: edrUnderdet
### Keywords: nonlinear

### ** Examples

## Not run: 
##D n <- 100
##D p <- 200
##D K <- 2
##D H <- 3:8
##D beta1 <- c(1,1,1,1,rep(0,p-4))
##D beta2 <- c(rep(0,p-4), 1,1,1,1)
##D X <- rmvnorm(n,sigma=diag(p))
##D eps <- rnorm(n,sd=10)
##D Y <- (X%*%beta1)^3 + (X%*%beta2)^3+eps
##D result <- edrUnderdet(Y,X,H,K,"SIR-QZ")
##D summary(result)
##D plot(result)
## End(Not run)



