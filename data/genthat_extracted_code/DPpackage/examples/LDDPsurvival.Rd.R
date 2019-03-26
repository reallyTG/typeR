library(DPpackage)


### Name: LDDPsurvival
### Title: Bayesian analysis for a Linear Dependent Dirichlet Process
###   Mixture of Survival Models
### Aliases: LDDPsurvival LDDPsurvival.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     #############################################################
##D     # Time to Cosmetic Deterioration of Breast Cancer Patients
##D     #############################################################
##D 
##D       data(deterioration)
##D       attach(deterioration)
##D       ymat <- cbind(left,right)
##D 
##D     # design matrix for posterior predictive 
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
##D       fit1 <- LDDPsurvival(ymat~trt,prior=prior,
##D                            mcmc=mcmc,state=state,status=TRUE,
##D                            grid=seq(0.01,70,1),zpred=zpred)
##D 
##D 
##D     # Plot posterior density estimates
##D     # with design vector x0=(1,0) 
##D 
##D       plot(fit1$grid,fit1$densp.h[1,],type="l",
##D            xlab="time",ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.l[1,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.m[1,],lty=1,lwd=3)
##D 
##D     # Plot posterior density estimates
##D     # with design vector x0=(1,1) 
##D 
##D       plot(fit1$grid,fit1$densp.h[2,],type="l",
##D            xlab="time",ylab="density",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.l[2,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$densp.m[2,],lty=1,lwd=3)
##D 
##D     # Plot posterior survival estimates
##D     # with design vector x0=(1,0) 
##D 
##D       plot(fit1$grid,fit1$survp.h[1,],type="l",
##D            xlab="time",ylab="survival",lty=2,lwd=2,ylim=c(0,1))
##D       lines(fit1$grid,fit1$survp.l[1,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$survp.m[1,],lty=1,lwd=3)
##D 
##D     # Plot posterior survival estimates
##D     # with design vector x0=(1,1) 
##D 
##D       plot(fit1$grid,fit1$survp.h[2,],type="l",
##D            xlab="time",ylab="survival",lty=2,lwd=2,ylim=c(0,1))
##D       lines(fit1$grid,fit1$survp.l[2,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$survp.m[2,],lty=1,lwd=3)
##D 
##D     # Plot posterior hazard estimates
##D     # with design vector x0=(1,0) 
##D 
##D       plot(fit1$grid,fit1$hazp.h[1,],type="l",
##D            xlab="time",ylab="hazard",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$hazp.l[1,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$hazp.m[1,],lty=1,lwd=3)
##D 
##D     # Plot posterior hazard estimates
##D     # with design vector x0=(1,1) 
##D 
##D       plot(fit1$grid,fit1$hazp.h[2,],type="l",
##D            xlab="time",ylab="survival",lty=2,lwd=2)
##D       lines(fit1$grid,fit1$hazp.l[2,],lty=2,lwd=2)
##D       lines(fit1$grid,fit1$hazp.m[2,],lty=1,lwd=3)
##D 
## End(Not run)



