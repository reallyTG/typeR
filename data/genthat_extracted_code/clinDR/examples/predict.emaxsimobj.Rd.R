library(clinDR)


### Name: predict.emaxsimobj
### Title: Mean response and SE for specified doses for a simulated
###   emaxsimobj object
### Aliases: predict.emaxsimobj
### Keywords: nonlinear

### ** Examples


## Not run: 
##D ## emaxsim changes the random number seed
##D nsim<-50
##D idmax<-5
##D doselev<-c(0,5,25,50,100)
##D n<-c(78,81,81,81,77)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D emax<-15.127726
##D sdy<-7.967897
##D pop.parm<-c(log(ed50),emax,e0)    
##D meanlev<-emaxfun(doselev,pop.parm)  
##D 
##D ###FixedMean is specialized constructor function for emaxsim
##D gen.parm<-FixedMean(n,doselev,meanlev,sdy)  
##D D1 <- emaxsim(nsim,gen.parm)
##D d10<-D1[10]
##D predict(d10,c(75,150))
## End(Not run)
## Don't show: 
## emaxsim changes the random number seed
nsim<-3
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop.parm<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop.parm)  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,sdy)  
D1 <- emaxsim(nsim,gen.parm,nproc=1)
d3<-D1[3]
predict(d3,c(75,150))
## End(Don't show)



