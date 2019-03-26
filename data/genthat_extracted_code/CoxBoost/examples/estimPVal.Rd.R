library(CoxBoost)


### Name: estimPVal
### Title: Estimate p-values for a model fitted by CoxBoost
### Aliases: estimPVal
### Keywords: models regression survial

### ** Examples

## Not run: 
##D #   Generate some survival data with 10 informative covariates 
##D n <- 200; p <- 100
##D beta <- c(rep(1,10),rep(0,p-10))
##D x <- matrix(rnorm(n*p),n,p)
##D real.time <- -(log(runif(n)))/(10*exp(drop(x %*% beta)))
##D cens.time <- rexp(n,rate=1/10)
##D status <- ifelse(real.time <= cens.time,1,0)
##D obs.time <- ifelse(real.time <= cens.time,real.time,cens.time)
##D 
##D #   Fit a Cox proportional hazards model by CoxBoost
##D 
##D cbfit <- CoxBoost(time=obs.time,status=status,x=x,stepno=100,
##D                   penalty=100) 
##D 
##D #   estimate p-values
##D 
##D p1 <- estimPVal(cbfit,x,permute.n=10)
##D 
##D #   get a second vector of estimates for checking how large
##D #   random variation is
##D 
##D p2 <- estimPVal(cbfit,x,permute.n=10)
##D 
##D plot(p1,p2,xlim=c(0,1),ylim=c(0,1),xlab="permute 1",ylab="permute 2")
## End(Not run)




