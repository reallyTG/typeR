library(clinDR)


### Name: FixedMean
### Title: Fixed means (proportions) random data constructor for emaxsim
###   for continuous or binary data
### Aliases: FixedMean
### Keywords: nonlinear

### ** Examples


## Not run: 
##D ##  example changes the random number seed
##D 
##D doselev<-c(0,5,25,50,100)
##D n<-c(78,81,81,81,77)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D emax<-15.127726
##D sdy<-7.967897
##D pop<-c(log(ed50),emax,e0)  
##D   
##D meanlev<-emaxfun(doselev,pop)  
##D 
##D ###FixedMean is specialized constructor function for emaxsim
##D gen.parm<-FixedMean(n,doselev,meanlev,sdy,pop)  
##D 
##D ### 4-parameter example
##D 
##D est<-c( log(6.67636), 2,0, -3.18230)
##D doselev<-c(0,5,10,25,50,150)
##D meanlev<-emaxfun(doselev,est)
##D 
##D gen.parm4<-FixedMean(n=c(99,95,98,94,98,99),doselev,
##D                      meanlev,resSD=3.87,parm=est)
##D D4 <- emaxsim(nsim=100,gen.parm4,modType=4,negEmax=TRUE)
##D summary(D4)
## End(Not run)
## Don't show: 
##  example changes the random number seed

doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)  
  
meanlev<-emaxfun(doselev,pop)  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,sdy,pop)  

## End(Don't show)



