library(clinDR)


### Name: predict.emaxalt
### Title: Mean response and SE for specified doses for a simulated object
###   output by function emaxalt
### Aliases: predict.emaxalt
### Keywords: nonlinear

### ** Examples


## Not run: 
##D ## random number seed changed by this example
##D 
##D doselev<-c(0,5,25,50,100)
##D n<-c(78,81,81,81,77)
##D dose<-rep(doselev,n)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D emax<-15.127726
##D sdy<-7.967897
##D pop.parm<-c(log(ed50),e0,emax)    
##D meanresp<-emaxfun(dose,pop.parm)  
##D y<-rnorm(sum(n),meanresp,sdy)
##D 
##D simout<-emaxalt(y,dose)
##D predict(simout,c(75,150))
##D 
##D simout2<-emaxalt(y,dose,modType=4)
##D predict(simout2,c(75,150))
## End(Not run)
## Don't show: 
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop.parm<-c(log(ed50),e0,emax)    
meanresp<-emaxfun(dose,pop.parm)  
y<-rnorm(sum(n),meanresp,sdy)

simout<-emaxalt(y,dose)
predict(simout,c(75,150))
## End(Don't show)



