library(DPpackage)


### Name: LDBDPdensity
### Title: Bounded Density Regression using Dependent Bernstein Polynomials
### Aliases: LDBDPdensity LDBDPdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ######################## 
##D     # Simulate data
##D     ########################
##D       nrec <- 500
##D       x <- runif(nrec)
##D       y <- rep(0,nrec)
##D       for(i in 1:nrec)
##D       {
##D            y[i] <- ifelse(runif(1) < (0.8-0.5*x[i]^2), 
##D                     rbeta(1,22-(x[i]^2)*20,5+x[i]*20),
##D                     rbeta(1,8+x[i]*5,20))
##D       }
##D 
##D     # true model
##D 
##D       true.dens <- function(grid,x)
##D       {
##D 	  (0.8-0.5*x^2)*dbeta(grid,22-(x^2)*20,5+x*20)+
##D           (0.2+0.5*x^2)*dbeta(grid,8+x*5,20)
##D       }	
##D 
##D       true.mean <- function(x)
##D       {
##D           (0.8-0.5*x^2)*(22-(x^2)*20)/(22-(x^2)*20+5+x*20)+
##D           (0.2+0.5*x^2)*(8+x*5)/(8+x*5+20)
##D       }	
##D 
##D     # predictions
##D       grid <- seq(0,1,len=100)
##D       npred <- 25
##D       xpred <- matrix(1,ncol=2,nrow=npred)
##D       xpred[,2] <- seq(0,1,len=npred)
##D 
##D     # prior
##D       prior <- list(maxn = 25,   
##D                     alpha = 1, 
##D                     lambda = 25, 
##D                     nu = 4, 
##D                     psiinv = diag(1000,2), 
##D                     m0 = rep(0,2),
##D                     S0 = diag(1000,2))
##D 
##D     # mcmc
##D       mcmc <- list(nburn = 5000, 
##D                    nskip = 3, 
##D                    ndisplay = 100, 
##D                    nsave = 5000)
##D 
##D     # state
##D       state <- NULL
##D 
##D     # fitting the model
##D 
##D       fit <- LDBDPdensity(formula=y~x,xpred=xpred,
##D                           prior=prior,
##D                           mcmc=mcmc,
##D                           state=NULL,status=TRUE,
##D                           grid=grid,
##D                           compute.band=TRUE,type.band="PD")
##D 
##D       fit
##D       summary(fit)
##D       plot(fit)
##D 
##D     # Plots for some predictions
##D     # (conditional density and mean function)
##D 
##D       par(mfrow=c(2,2))
##D       plot(fit$grid,fit$densp.h[7,],type="l",lwd=2,
##D            xlim=c(0,1),ylim=c(0,4),xlab="y",ylab="density",lty=2) 
##D       lines(fit$grid,fit$densp.m[7,],lwd=2,lty=1) 
##D       lines(fit$grid,fit$densp.l[7,],lwd=2,lty=2)
##D       lines(fit$grid,true.dens(fit$grid,fit$xpred[7,2]),lwd=2,col="red")
##D 
##D       plot(fit$grid,fit$densp.h[13,],type="l",lwd=2,
##D            xlim=c(0,1),ylim=c(0,4),xlab="y",ylab="density",lty=2) 
##D       lines(fit$grid,fit$densp.m[13,],lwd=2,lty=1) 
##D       lines(fit$grid,fit$densp.l[13,],lwd=2,lty=2)
##D       lines(fit$grid,true.dens(fit$grid,fit$xpred[13,2]),lwd=2,col="red")
##D 
##D       plot(fit$grid,fit$densp.h[19,],type="l",lwd=2,
##D            xlim=c(0,1),ylim=c(0,4),xlab="y",ylab="density",lty=2) 
##D       lines(fit$grid,fit$densp.m[19,],lwd=2,lty=1) 
##D       lines(fit$grid,fit$densp.l[19,],lwd=2,lty=2)
##D       lines(fit$grid,true.dens(fit$grid,fit$xpred[19,2]),lwd=2,col="red")
##D 
##D       plot(x,y) 
##D       lines(fit$xpred[,2],fit$meanfp.m,lwd=2,lty=1) 
##D       lines(fit$xpred[,2],fit$meanfp.l,lwd=2,lty=2)
##D       lines(fit$xpred[,2],fit$meanfp.h,lwd=2,lty=2)
##D       lines(fit$xpred[,2],true.mean(fit$xpred[,2]),lwd=2,lty=1,col="red")
## End(Not run)



