library(DPpackage)


### Name: DPsurvint
### Title: Bayesian analysis for a semiparametric AFT regression model
### Aliases: DPsurvint DPsurvint.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # A simulated Data Set
##D     ####################################
##D      ind<-rbinom(100,1,0.5)
##D      vsim<-ind*rnorm(100,1,0.25)+(1-ind)*rnorm(100,3,0.25)
##D      x1<-rep(c(0,1),50)
##D      x2<-rnorm(100,0,1)
##D      etasim<-x1+-1*x2
##D      time<-vsim*exp(-etasim)
##D      y<-matrix(-999,nrow=100,ncol=2)
##D      for(i in 1:100){
##D         for(j in 1:15){
##D          if((j-1)<time[i] & time[i]<=j){
##D             y[i,1]<-j-1
##D             y[i,2]<-j
##D          }
##D      }
##D      if(time[i]>15)y[i,1]<-15
##D      }
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-20000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay,tune=0.125)
##D 
##D     # Prior information
##D       prior <- list(alpha=1,beta0=rep(0,2),Sbeta0=diag(1000,2),
##D                     m0=0,s0=1,tau1=0.01,tau2=0.01)
##D 
##D 
##D     # Fit the model
##D 
##D       fit1 <- DPsurvint(y~x1+x2,prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE) 
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="x1")	
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="mu")	
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit1)      
##D 
##D     # Predictive information with covariates
##D       npred<-10
##D       xnew<-cbind(rep(1,npred),seq(-1.5,1.5,length=npred))
##D       xnew<-rbind(xnew,cbind(rep(0,npred),seq(-1.5,1.5,length=npred)))
##D       grid<-seq(0.00001,14,0.5)
##D       pred1<-predict(fit1,xnew=xnew,grid=grid)
##D 
##D     # Plot Baseline information
##D       plot(pred1,all=FALSE,band=TRUE)
##D 
##D 
##D     #############################################################
##D     # Time to Cosmetic Deterioration of Breast Cancer Patients
##D     #############################################################
##D 
##D       data(deterioration)
##D       attach(deterioration)
##D       y<-cbind(left,right)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-20000
##D       nsave<-10000
##D       nskip<-20
##D       ndisplay<-1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay,tune=0.25)
##D 
##D     # Prior information
##D       prior <- list(alpha=10,beta0=rep(0,1),Sbeta0=diag(100,1),
##D                     m0=0,s0=1,tau1=0.01,tau2=0.01)
##D 
##D     # Fitting the model
##D 
##D       fit2 <- DPsurvint(y~trt,prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE) 
##D       fit2
##D       
##D     # Summary with HPD and Credibility intervals
##D       summary(fit2)
##D       summary(fit2,hpd=FALSE)
##D 
##D     # Plot model parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit2)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit2)      
##D 
##D     # Predictive information with covariates
##D       xnew<-matrix(c(0,1),nrow=2,ncol=1)
##D       grid<-seq(0.01,70,1)
##D       pred2<-predict(fit2,xnew=xnew,grid=grid)
##D       plot(pred2,all=FALSE,band=TRUE)
##D 
## End(Not run)      



