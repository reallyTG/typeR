library(clinDR)


### Name: "Extract.emaxsim"
### Title: Extract a simulation from the output of emaxsim
### Aliases: "Extract.emaxsim" [.emaxsim
### Keywords: nonlinear

### ** Examples


## Not run: 
##D ## code change random number seed
##D 
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
##D pop<-c(log(ed50),emax,e0)    
##D meanlev<-emaxfun(doselev,pop)  
##D 
##D ###FixedMean is specialized constructor function for emaxsim
##D gen.parm<-FixedMean(n,doselev,meanlev,sdy)  
##D 
##D D1 <- emaxsim(nsim,gen.parm,modType=3)
##D e49<-D1[49]                  #### extract 49th simulation
##D 
## End(Not run)
## Don't show: 
## code change random number seed

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
gen.parm<-FixedMean(n,doselev,meanlev,sdy)  

D1 <- emaxsim(nsim=2,gen.parm,modType=3,nproc=1)
e49<-D1[2]                  
## End(Don't show)



