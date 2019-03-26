library(DPpackage)


### Name: LDPDdoublyint
### Title: Bayesian analysis for a Linear Dependent Poisson Dirichlet
###   Process Mixture Models for the Analysis of Doubly-Interval-Censored
###   Data
### Aliases: LDPDdoublyint LDPDdoublyint.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D ###############################################################
##D # HIV-AIDS Data
##D ###############################################################
##D 
##D   data(hiv)
##D   attach(hiv)
##D 
##D ###############################################################
##D # Working folder
##D ###############################################################
##D 
##D   work.dir <- NULL
##D 
##D ###############################################################
##D # Response and design matrices
##D ###############################################################
##D 
##D   nsubject <- length(onsetL)
##D   onset <- cbind(onsetL,onsetU)
##D   failure <- cbind(failureL,failureU)
##D 
##D   intercept <- rep(1,nsubject)
##D   p <- 2
##D   xonset <- cbind(IntO=intercept,trtO=trt)
##D   q <- 2
##D   xfailure <- cbind(IntF=intercept,trtF=trt)
##D 
##D ###############################################################
##D # Predictions
##D ###############################################################
##D 
##D    grid <- matrix(c(rep(seq(0,30,len=30),1),
##D                     rep(seq(0,20,len=30),1)),nrow=2,byrow=T)
##D 
##D    xpred <- matrix(c(rep(c(1,0),1),rep(c(1,0),1),
##D                      rep(c(1,1),1),rep(c(1,1),1)),
##D                      nrow=2,byrow=T)
##D 
##D    colnames(xpred) <- colnames(cbind(xonset,xfailure))
##D 
##D ###############################################################
##D # Initial state
##D ###############################################################
##D 
##D   state <- NULL
##D 
##D ###############################################################
##D # Prior
##D ###############################################################
##D   
##D   prior<-list(a0=1,
##D               b0=1,
##D               q=0.5,
##D               mub=10,
##D               sigmab=200,
##D               nu=4,
##D               tinv=diag(1,2),
##D               nub=6,
##D               tbinv=diag(1,4),
##D               m0=rep(0,4),
##D               S0=diag(100,4),
##D               maxm=40)
##D 
##D ###############################################################
##D # MCMC
##D ###############################################################
##D   
##D   mcmc<-list(nburn=5000,
##D              nskip=9,
##D              ndisplay=100,
##D              nsave=5000,
##D              tune1=0.25,
##D              tune2=1)
##D 
##D ###############################################################
##D # Fitting the Model
##D ###############################################################
##D 
##D   fit1 <- LDPDdoublyint(onset=onset,failure=failure,
##D                         p=p,xonset=xonset,
##D                         q=q,xfailure=xfailure,
##D                         xpred=xpred,grid=grid,
##D                         prior=prior,
##D                         mcmc=mcmc,
##D                         state=state,
##D                         status=TRUE,
##D                         work.dir=work.dir)
##D  
##D   fit1
##D   summary(fit1)
##D 
##D ###############################################################
##D # Getting Information for Predictions
##D ###############################################################
##D   
##D # Without CI bands and intervals
##D 
##D   fit1.pred <- predict(fit1)
##D   fit1.pred
##D   plot(fit1.pred)
##D 
##D # With CI bands and intervals
##D  
##D   fit1.pred <- predict(fit1,compute.band=TRUE)
##D   fit1.pred
##D   plot(fit1.pred)
## End(Not run)



