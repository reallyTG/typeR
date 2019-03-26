library(clinDR)


### Name: predict.fitEmax
### Title: Estimated mean/proportion and confidence intervals derived from
###   the maximum likelihood fit of a 3- or 4- parameter Emax model.
### Aliases: predict.fitEmax
### Keywords: nonlinear

### ** Examples


## Not run: 
##D ## this example changes the random number seed
##D doselev<-c(0,5,25,50,100,350)
##D n<-c(78,81,81,81,77,80)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D emax<-15.127726
##D sdy<-8.0
##D pop.parm<-c(log(ed50),emax,e0)    
##D dose<-rep(doselev,n)
##D meanlev<-emaxfun(dose,pop.parm)  
##D 
##D y<-rnorm(sum(n),meanlev,sdy)
##D 
##D testout<-fitEmax(y,dose,modType=4)
##D predout<-predict(testout,dosevec=c(20,80),int=1)
## End(Not run)
## Don't show: 
## this example changes the random number seed
doselev<-c(0,5,25,50,100,350)
n<-c(78,81,81,81,77,80)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop.parm<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop.parm)  

y<-rnorm(sum(n),meanlev,sdy)

testout<-fitEmax(y,dose,modType=4)
predout<-predict(testout,dosevec=c(20,80),int=1)
## End(Don't show)



