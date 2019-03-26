library(clinDR)


### Name: emaxalt
### Title: Fit 4- or 3-parameter Emax model substituting simpler curves if
###   convergence not achieved.
### Aliases: emaxalt
### Keywords: nonlinear

### ** Examples


save.seed<-.Random.seed
set.seed(12357)

doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)
dose<-rep(doselev,n)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop<-c(log(ed50),emax,e0)    
meanresp<-emaxfun(dose,pop)  
y<-rnorm(sum(n),meanresp,sdy)

simout<-emaxalt(y,dose)

simout2<-emaxalt(y,dose,modType=4)

.Random.seed<-save.seed



