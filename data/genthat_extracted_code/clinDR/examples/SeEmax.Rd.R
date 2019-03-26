library(clinDR)


### Name: SeEmax
### Title: Asymptotic SE for dose response estimates from a 3- or 4-
###   parameter Emax model
### Aliases: SeEmax
### Keywords: nonlinear

### ** Examples


## Not run: 
##D 
##D ## this example changes the random number seed
##D doselev<-c(0,5,25,50,100,250)
##D n<-c(78,81,81,81,77,80)
##D dose<-rep(doselev,n)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D led50<-log(ed50)
##D emax<-15.127726
##D lambda=1.8
##D sdy<-7.967897
##D pop<-c(led50=led50,lambda=lambda,emax=emax,e0=e0)    
##D meanresp<-emaxfun(dose,pop)  
##D y<-rnorm(sum(n),meanresp,sdy)
##D nls.fit<-nls(y ~ e0 + (emax * dose^lambda)/(dose^lambda + exp(led50*lambda)), 
##D                          start = pop, control = nls.control(
##D                          maxiter = 100),trace=TRUE,na.action=na.omit)
##D 
##D 
##D SeEmax(nls.fit,doselev=c(60,120),modType=4)
##D SeEmax(list(coef(nls.fit),vcov(nls.fit)),c(60,120),modType=4)
## End(Not run)
## Don't show: 

## this example changes the random number seed
doselev<-c(0,5,25,50,100,250)
n<-c(78,81,81,81,77,80)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
led50<-log(ed50)
emax<-15.127726
lambda=1.8
sdy<-7.967897
pop<-c(led50=led50,lambda=lambda,emax=emax,e0=e0)    
meanresp<-emaxfun(dose,pop)  
y<-rnorm(sum(n),meanresp,sdy)
nls.fit<-nls(y ~ e0 + (emax * dose^lambda)/(dose^lambda + exp(led50*lambda)), 
                         start = pop, control = nls.control(
                         maxiter = 100),trace=TRUE,na.action=na.omit)


SeEmax(nls.fit,doselev=c(60,120),modType=4)
## End(Don't show)



