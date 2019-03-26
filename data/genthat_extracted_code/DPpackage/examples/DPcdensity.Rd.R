library(DPpackage)


### Name: DPcdensity
### Title: Bayesian Semiparametric Conditional Density Estimation using a
###   DPM of normals
### Aliases: DPcdensity DPcdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ########################################################## 
##D     # Simulated data:
##D     # Here we replicate the results reported with 
##D     # simulated data by Dunson, Pillai and Park (2007,
##D     # JRSS Ser. B, 69: 163-183, pag 177) where a different
##D     # approach is proposed. 
##D     ##########################################################
##D 
##D       dtrue <- function(grid,x)
##D       {
##D           exp(-2*x)*dnorm(grid,mean=x,sd=sqrt(0.01))+
##D           (1-exp(-2*x))*dnorm(grid,mean=x^4,sd=sqrt(0.04))
##D       } 
##D 
##D       nobs <- 500
##D       x <- runif(nobs)
##D       y1 <- x + rnorm(nobs, 0, sqrt(0.01))
##D       y2 <- x^4 + rnorm(nobs, 0, sqrt(0.04))
##D 
##D       u <- runif(nobs)
##D       prob <- exp(-2*x)
##D       y <- ifelse(u<prob,y1,y2)
##D 
##D     # Prior information
##D       w <- cbind(y,x)  
##D       wbar <- apply(w,2,mean)
##D       wcov <- var(w)
##D 
##D       prior <- list(a0=10,
##D                     b0=1,
##D                     nu1=4,
##D                     nu2=4,
##D                     s2=0.5*wcov,
##D                     m2=wbar,
##D                     psiinv2=2*solve(wcov),
##D                     tau1=6.01,
##D                     tau2=2.01)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       mcmc <- list(nburn=5000,
##D                    nsave=5000,
##D                    nskip=3,
##D                    ndisplay=100)
##D 
##D     # fitting the model
##D       xpred <- c(0.00,0.05,0.10,0.15,0.20,0.25,
##D                  0.30,0.35,0.40,0.45,0.49,0.55,
##D                  0.60,0.65,0.70,0.75,0.80,0.85,
##D                  0.88,0.95,1.00)     
##D 
##D       fit <- DPcdensity(y=y,x=x,xpred=xpred,ngrid=100, 
##D                         prior=prior, 
##D                         mcmc=mcmc, 
##D                         state=state, 
##D                         status=TRUE,
##D                         compute.band=TRUE,type.band="PD")
##D 
##D     # true model and estimates
##D       par(mfrow=c(2,3))      
##D 
##D       plot(fit$grid,fit$densp.h[3,],lwd=1,type="l",lty=2,
##D            main="x=0.10",xlab="values",ylab="density",ylim=c(0,4))
##D       lines(fit$grid,fit$densp.l[3,],lwd=1,type="l",lty=2)
##D       lines(fit$grid,fit$densp.m[3,],lwd=2,type="l",lty=1)
##D       lines(fit$grid,dtrue(fit$grid,xpred[3]),lwd=2,
##D             type="l",lty=1,col="red")
##D       
##D       plot(fit$grid,fit$densp.h[6,],lwd=1,type="l",lty=2,
##D            main="x=0.25",xlab="values",ylab="density",ylim=c(0,4))
##D       lines(fit$grid,fit$densp.l[6,],lwd=1,type="l",lty=2)
##D       lines(fit$grid,fit$densp.m[6,],lwd=2,type="l",lty=1)
##D       lines(fit$grid,dtrue(fit$grid,xpred[6]),lwd=2,
##D             type="l",lty=1,col="red")
##D       
##D       plot(fit$grid,fit$densp.h[11,],lwd=1,type="l",lty=2,
##D            main="x=0.49",xlab="values",ylab="density",ylim=c(0,4))
##D       lines(fit$grid,fit$densp.l[11,],lwd=1,type="l",lty=2)
##D       lines(fit$grid,fit$densp.m[11,],lwd=2,type="l",lty=1)
##D       lines(fit$grid,dtrue(fit$grid,xpred[11]),lwd=2,type="l",
##D             lty=1,col="red")
##D       
##D       plot(fit$grid,fit$densp.h[16,],lwd=1,type="l",lty=2,
##D            main="x=0.75",xlab="values",ylab="density",ylim=c(0,4))
##D       lines(fit$grid,fit$densp.l[16,],lwd=1,type="l",lty=2)
##D       lines(fit$grid,fit$densp.m[16,],lwd=2,type="l",lty=1)
##D       lines(fit$grid,dtrue(fit$grid,xpred[16]),lwd=2,type="l",
##D             lty=1,col="red")
##D       
##D       plot(fit$grid,fit$densp.h[19,],lwd=1,type="l",lty=2,
##D            main="x=0.75",xlab="values",ylab="density",ylim=c(0,4))
##D       lines(fit$grid,fit$densp.l[19,],lwd=1,type="l",lty=2)
##D       lines(fit$grid,fit$densp.m[19,],lwd=2,type="l",lty=1)
##D       lines(fit$grid,dtrue(fit$grid,xpred[19]),lwd=2,type="l",
##D             lty=1,col="red")
##D 
##D     # data and mean function
##D       plot(x,y,xlab="x",ylab="y",main="")
##D       lines(xpred,fit$meanfp.m,type="l",lwd=2,lty=1)
##D       lines(xpred,fit$meanfp.l,type="l",lwd=2,lty=2)
##D       lines(xpred,fit$meanfp.h,type="l",lwd=2,lty=2)
##D 
## End(Not run)



