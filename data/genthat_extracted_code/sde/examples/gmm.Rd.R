library(sde)


### Name: gmm
### Title: Generalized method of moments estimator
### Aliases: gmm
### Keywords: ts

### ** Examples

## Not run: 
##D alpha <- 0.5
##D beta <- 0.2
##D sigma <- sqrt(0.05)
##D true <- c(alpha, beta, sigma)
##D names(true) <- c("alpha", "beta", "sigma")
##D 
##D x0 <- rsCIR(1,theta=true)
##D set.seed(123)
##D sde.sim(X0=x0,model="CIR",theta=true,N=500000,delta=0.001) -> X
##D X <- window(X, deltat=0.1)
##D DELTA = deltat(X)
##D n <- length(X) 
##D X <- window(X, start=n*DELTA*0.5)
##D plot(X)
##D 
##D u <- function(x, y, theta, DELTA){
##D   c.mean <- theta[1]/theta[2] + 
##D              (y-theta[1]/theta[2])*exp(-theta[2]*DELTA)
##D   c.var <- ((y*theta[3]^2 * 
##D      (exp(-theta[2]*DELTA)-exp(-2*theta[2]*DELTA))/theta[2] +  
##D 	  theta[1]*theta[3]^2*
##D 	  (1-exp(-2*theta[2]*DELTA))/(2*theta[2]^2)))  
##D   cbind(x-c.mean,y*(x-c.mean), c.var-(x-c.mean)^2, 
##D         y*(c.var-(x-c.mean)^2))  
##D }
##D 
##D CIR.lik <- function(theta1,theta2,theta3) {
##D  n <- length(X)
##D  dt <- deltat(X)
##D  -sum(dcCIR(x=X[2:n], Dt=dt, x0=X[1:(n-1)], 
##D    theta=c(theta1,theta2,theta3), log=TRUE))
##D }
##D 
##D fit <- mle(CIR.lik, start=list(theta1=.1,  theta2=.1,theta3=.3), 
##D     method="L-BFGS-B",lower=c(0.001,0.001,0.001), upper=c(1,1,1))
##D # maximum likelihood estimates
##D coef(fit)
##D 
##D 
##D gmm(X,u, guess=as.numeric(coef(fit)), lower=c(0,0,0), 
##D     upper=c(1,1,1))
##D 
##D true
## End(Not run)


