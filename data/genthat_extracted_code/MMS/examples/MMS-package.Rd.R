library(MMS)


### Name: MMS-package
### Title: Fixed Effects Selection in Linear Mixed Models
### Aliases: MMS-package MMS

### ** Examples

## Not run: 
##D N <- 20           # number of groups
##D p <- 20            # number of covariates (including intercept)
##D q <- 2            # number of random effect covariates
##D ni <- rep(6,N)    # observations per group
##D n <- sum(ni)   # total number of observations
##D 
##D grp <- factor(rep(1:N,ni)) # grouping variable
##D grp=rbind(grp,grp)
##D 
##D beta <- c(1,2,4,3,rep(0,p-3)) # fixed-effects coefficients
##D x <- cbind(1,matrix(rnorm(n*p),nrow=n)) # design matrix
##D 
##D u1=rnorm(N,0,sd=sqrt(2))
##D u2=rnorm(N,0,sd=sqrt(2))
##D bi1 <- rep(u1,ni)
##D bi2 <- rep(u2,ni)
##D bi <- rbind(bi1,bi2)
##D 
##D z=x[,1:2,drop=FALSE]
##D 
##D epsilon=rnorm(120)
##D y <- numeric(n)
##D for (k in 1:n) y[k] <- x[k,]%*%beta + t(z[k,])%*%bi[,k] + epsilon[k]
##D ######
##D fit0=lmme(x[,1:4],y,z,grp)
##D fit1=lassop(x,y,z,grp,mu=0.2,fix=1,rand=c(1,2))
##D #fit1=lassop(x,y,z,grp,mu=0.2,fix=1,rand=c(1,2),showit=TRUE)
##D 
##D fit2=mhtp(x,y,z,grp,fix=1,rand=c(1,2),alpha=0.1,num=15)
##D #fit2=mhtp(x,y,z,grp,fix=1,rand=c(1,2),alpha=0.1,num=15,show=c(1,1,1))
## End(Not run)



