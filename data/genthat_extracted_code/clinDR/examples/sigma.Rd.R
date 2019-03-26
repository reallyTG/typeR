library(clinDR)


### Name: sigmaEmax
### Title: Extract Emax model residual SD estimates
### Aliases: sigma.fitEmax sigma.fitEmaxB sigma.emaxsim sigma.emaxsimB
### Keywords: nonlinear

### ** Examples

doselev<-c(0,5,25,50,100,350)
n<-c(78,81,81,81,77,80)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  

y<-rnorm(sum(n),meanlev,sdy)

testout<-fitEmax(y,dose,modType=4)
sigma(testout)



