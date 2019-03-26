library(DPpackage)


### Name: LDDPdensity
### Title: Bayesian analysis for a Linear Dependent Dirichlet Process
###   Mixture Model
### Aliases: LDDPdensity LDDPdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ########################################################## 
##D     # Simulate data from a mixture of two normal densities
##D     ##########################################################
##D       nobs <- 500
##D       y1   <-rnorm(nobs, 3,.8)
##D 
##D       ## y2 = 0.6
##D       y21 <- rnorm(nobs,1.5, 0.8)
##D       y22 <- rnorm(nobs,4.0, 0.6)
##D       u <- runif(nobs)
##D       y2 <- ifelse(u<0.6,y21,y22)
##D       y <- c(y1,y2)
##D 
##D       ## design matrix including a single factor
##D       trt <- c(rep(0,nobs),rep(1,nobs))
##D 
##D       ## design matrix for posterior predictive 
##D       zpred <- rbind(c(1,0),c(1,1))  
##D 
##D     # Prior information
##D 
##D       S0 <- diag(100,2)
##D       m0 <- rep(0,2)
##D       psiinv <- diag(1,2)
##D      
##D       prior <- list(a0=10,
##D                     b0=1,
##D                     nu=4,
##D                     m0=m0,
##D                     S0=S0,
##D                     psiinv=psiinv,
##D                     tau1=6.01,
##D                     taus1=6.01,
##D                     taus2=2.01)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 3
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fit the model
##D       fit1 <- LDDPdensity(y~trt,prior=prior,mcmc=mcmc,
##D                           state=state,status=TRUE,
##D                           ngrid=200,zpred=zpred,
##D                           compute.band=TRUE,type.band="PD")
##D 
##D 
##D     # Plot posterior density estimate
##D     # with design vector x0=(1,0) 
##D 
##D       plot(fit1$grid,fit1$densp.h[1,],type="l",xlab="Y",
##D            ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.l[1,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.m[1,],lty=1,lwd=3)
##D 
##D       # add true density to the plot
##D       p1 <- dnorm(fit1$grid, 3.0, 0.8)
##D       lines(fit1$grid,p1,lwd=2,lty=1, col="red")
##D 
##D     # Plot posterior density estimate
##D     # with design vector x0=(1,1) 
##D 
##D       plot(fit1$grid,fit1$densp.h[2,],type="l",xlab="Y",
##D            ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.l[2,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.m[2,],lty=1,lwd=3)
##D 
##D       # add true density to the plot
##D       p2 <- 0.6*dnorm(fit1$grid, 1.5, 0.8) +
##D             0.4*dnorm(fit1$grid, 4.0, 0.6) 
##D       lines(fit1$grid,p2,lwd=2,lty=1, col="red")
##D 
##D 
##D     # Plot posterior CDF estimate
##D     # with design vector x0=(1,0) 
##D 
##D       plot(fit1$grid,fit1$cdfp.h[1,],type="l",xlab="Y",
##D            ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$cdfp.l[1,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$cdfp.m[1,],lty=1,lwd=3)
##D 
##D       # add true CDF to the plot
##D       p1 <- pnorm(fit1$grid, 3.0, 0.8)
##D       lines(fit1$grid,p1,lwd=2,lty=1, col="red")
##D 
##D     # Plot posterior CDF estimate
##D     # with design vector x0=(1,1) 
##D 
##D       plot(fit1$grid,fit1$cdfp.h[2,],type="l",xlab="Y",
##D            ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$cdfp.l[2,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$cdfp.m[2,],lty=1,lwd=3)
##D 
##D       # add true density to the plot
##D       p2 <- 0.6*pnorm(fit1$grid, 1.5, 0.8) +
##D             0.4*pnorm(fit1$grid, 4.0, 0.6) 
##D       lines(fit1$grid,p2,lwd=2,lty=1, col="red")
##D 
## End(Not run)



