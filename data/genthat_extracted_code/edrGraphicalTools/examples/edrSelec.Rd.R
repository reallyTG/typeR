library(edrGraphicalTools)


### Name: edrSelec
### Title: Variable selection based on sliced inverse regression
### Aliases: edrSelec
### Keywords: nonlinear

### ** Examples

	## Not run: 
##D n <- 100
##D p <- 110
##D K <- 1
##D H <- 5:12
##D NZero <- 1000
##D pZero <- 10
##D zeta <- 0.1
##D beta <- c(1,1,1,1,rep(0,p-4))
##D U <- matrix(runif(p^2,-0.05,0.05),ncol=p) 
##D X <- rmvnorm(n,sigma=diag(p) + U %*% t(U))
##D eps <- rnorm(n,sd=10)
##D Y <- (X%*%beta)^3+eps
##D result <- edrSelec(Y,X,H,K,"CSS",NZero=NZero, pZero=pZero, zeta=zeta)
##D summary(result)
##D plot(result)
## End(Not run)




