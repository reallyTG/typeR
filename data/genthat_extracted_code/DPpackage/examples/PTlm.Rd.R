library(DPpackage)


### Name: PTlm
### Title: Bayesian analysis for a semiparametric linear regression model
### Aliases: PTlm PTlm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # A simulated Data Set
##D     # (Mixture of Normals)
##D     ####################################
##D 
##D       ind<-rbinom(100,1,0.5)
##D       vsim<-ind*rnorm(100,1,0.15)+(1-ind)*rnorm(100,3,0.15)
##D 
##D       x1<-rep(c(0,1),50)
##D       x2<-rnorm(100,0,1)
##D 
##D       etasim<-x1+-1*x2
##D       y<-etasim+vsim
##D 
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-20
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Prior information
##D       prior <- list(alpha=1,beta0=rep(0,3),Sbeta0=diag(1000,3),
##D                     tau1=0.01,tau2=0.01,M=6)
##D 
##D     # Fit the model
##D 
##D       fit1 <- PTlm(formula=y~x1+x2,prior=prior,mcmc=mcmc,state=state,
##D                    status=TRUE) 
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1)
##D       plot(fit1,nfigr=2,nfigc=2)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit1)
##D       
##D 
##D     ############################################
##D     # The Australian Institute of Sport's data
##D     # (Skew data example)
##D     ############################################
##D       data(sports)
##D       attach(sports)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-20
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Prior information
##D       prior <- list(alpha=1,beta0=rep(0,3),Sbeta0=diag(1000,3),
##D                     tau1=0.01,tau2=0.01,M=8)
##D 
##D     # Fit the model
##D 
##D       fit2 <- PTlm(formula=bmi~lbm+gender,prior=prior,mcmc=mcmc,
##D                    state=state,status=TRUE) 
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit2)
##D       summary(fit2,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit2)
##D       plot(fit2,nfigr=2,nfigc=2)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit2)
##D 
## End(Not run)      



