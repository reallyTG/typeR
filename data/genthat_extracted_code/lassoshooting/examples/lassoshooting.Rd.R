library(lassoshooting)


### Name: lassoshooting
### Title: Lasso Shooting
### Aliases: lassoshooting
### Keywords: selection multivariate models graphs

### ** Examples

  ## Not run: 
##D set.seed(42)
##D 
##D b <- seq(3,3,length=10)
##D n<-100;
##D p<-10; 
##D X <- matrix(rnorm(n*p),n,p)
##D noise <- as.matrix(rnorm(n,sd=0.1))
##D y <- X ##D 
##D 
##D require(lassoshooting)
##D # FIXME: write proper example using R built in dataset
##D #add intercept column to the design matrix
##D Xdesign <- cbind(1,X)
##D lambda <- 20
##D #don't penalize the intercept
##D bhat <- lassoshooting(X=Xdesign,y=y,lambda=lambda,nopenalize=0) 
##D 
##D #above equals below 
##D bhat1 <- lassoshooting(X=Xdesign,y=y,lambda=2*lambda,penaltyweight=c(0,seq(0.5,0.5,length=p-1)))
##D 
##D T1 <- all(abs(bhat1-bhat) < 1e-20)
##D 
##D c <- 10
##D bhat2 <- lassoshooting(X=Xdesign,y=y, lambda=lambda, penaltyweight=c(0,1,1,1,1,1,c,c,c,c,c))
##D 
##D T2 <- all(bhat2[2:6] > bhat2[7:11])
##D T1 && T2
##D   
## End(Not run)



