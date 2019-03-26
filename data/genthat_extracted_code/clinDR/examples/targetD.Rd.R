library(clinDR)


### Name: targetD
### Title: Compute the MLE (and its SE) of the dose achieving a specified
###   target improvement from placebo.
### Aliases: targetD
### Keywords: nonlinear

### ** Examples

    ## Not run: 
##D 
##D 		## emaxsim changes the random number seed
##D     doselev<-c(0,5,25,50,100,250)
##D     n<-c(78,81,81,81,77,80)
##D     dose<-rep(doselev,n)
##D 
##D     ### population parameters for simulation
##D     e0<-2.465375 
##D     ed50<-67.481113 
##D     emax<-15.127726
##D     sdy<-7.967897
##D     pop<-c(led50=log(ed50),emax=emax,e0=e0)    
##D     meanresp<-emaxfun(dose,pop)  
##D     y<-rnorm(sum(n),meanresp,sdy)
##D     nls.fit<-nls(y ~ e0 + (emax * dose)/(dose + exp(led50)), 
##D                               start = pop, control = nls.control(
##D                               maxiter = 100),trace=TRUE,na.action=na.omit)
##D 
##D     targetD(nls.fit,10,modType=3)
##D 
##D     ###
##D     ### apply targetD to an emaxsim object
##D     ###
##D     nsim<-50
##D     sdy<-25
##D     gen.parm<-FixedMean(n,doselev,emaxfun(doselev,pop),sdy)  
##D     D4 <- emaxsim(nsim,gen.parm,modType=4)
##D     summary(D4,testalph=0.05)
##D 
##D     out<-NULL
##D     for(i in 1:nsim){
##D         out<-rbind(out,targetD(D4[i],target=4))
##D     }
## End(Not run)
    ## Don't show: 

		## emaxsim changes the random number seed
    doselev<-c(0,5,25,50,100,250)
    n<-c(78,81,81,81,77,80)
    dose<-rep(doselev,n)

    ### population parameters for simulation
    e0<-2.465375 
    ed50<-67.481113 
    emax<-15.127726
    sdy<-7.967897
    pop<-c(led50=log(ed50),emax=emax,e0=e0)    
    meanresp<-emaxfun(dose,pop)  
    y<-rnorm(sum(n),meanresp,sdy)
    nls.fit<-nls(y ~ e0 + (emax * dose)/(dose + exp(led50)), 
                              start = pop, control = nls.control(
                              maxiter = 100),trace=TRUE,na.action=na.omit)

    targetD(nls.fit,10,modType=3)
## End(Don't show)



