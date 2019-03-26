library(DPpackage)


### Name: DPbinary
### Title: Bayesian analysis for a semiparametric Bernoulli regression
###   model
### Aliases: DPbinary DPbinary.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Bioassay Data Example
##D     # Cox, D.R. and Snell, E.J. (1989). Analysis of Binary Data. 2nd ed. 
##D     # Chapman and Hall. p. 7  
##D     # In this example there are 150 subjects at 5 different stimulus levels, 
##D     # 30 at each level.
##D 
##D       y<-c(rep(0,30-2),rep(1,2),
##D            rep(0,30-8),rep(1,8),
##D            rep(0,30-15),rep(1,15),
##D            rep(0,30-23),rep(1,23),
##D            rep(0,30-27),rep(1,27))
##D 
##D       x<-c(rep(0,30),
##D            rep(1,30),
##D            rep(2,30),
##D            rep(3,30),
##D            rep(4,30))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune=1.1)
##D 
##D 
##D     # Prior distribution
##D       prior <- list(a0=2,b0=1,beta0=rep(0,2), Sbeta0=diag(10000,2))
##D 
##D     # Fit the model
##D       fit1 <- DPbinary(y~x,prior=prior,mcmc=mcmc,state=state,status=TRUE) 
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1)
##D       plot(fit1,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter (to see the plots gradually 
##D     # set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="x")	
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="ncluster")	
##D       plot(fit1,ask=FALSE,param="link",nfigc=1,nfigr=1)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit1)
##D 
##D     # Predictive Distribution
##D       npred<-40  
##D       xnew<-cbind(rep(1,npred),seq(0,4,length=npred))
##D 
##D       pp<-predict(fit1,xnew)       
##D 
##D       plot(seq(0,4,length=npred),pp$pmean,type='l',ylim=c(0,1),
##D            xlab="log2(concentration)",ylab="Probability")
##D       
##D     # Adding MLE estimates
##D       points(c(0,1,2,3,4),c(0.067,0.267,0.500,0.767,0.900),col="red")
##D 
## End(Not run)      



