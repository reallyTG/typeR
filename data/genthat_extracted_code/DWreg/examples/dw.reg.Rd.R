library(DWreg)


### Name: dw.reg
### Title: DW regression
### Aliases: dw.reg
### Keywords: dw.reg

### ** Examples

#simulated example (para.q1=TRUE, beta constant)
theta0 <- 2
theta1 <- 0.5
beta<-0.5
n<-500
x <- runif(n=n, min=0, max=1.5)
logq<-theta0 + theta1 * x - log(1+exp(theta0  + theta1 * x))		
y<-unlist(lapply(logq,function(x,beta) rdw(1,q=exp(x),beta),beta=beta)) 
data.sim<-data.frame(x,y) #simulated data
fit<-dw.reg(y~x,data=data.sim,para.q1=TRUE)
fit$tTable	

#simulated example (para.q2=TRUE, beta constant)
theta0 <- -2
theta1 <- -0.5
beta<-0.5
n<-500
x <- runif(n=n, min=0, max=1.5)
logq<--exp(theta0  + theta1 * x)		
y<-unlist(lapply(logq,function(x,beta) rdw(1,q=exp(x),beta),beta=beta)) 
data.sim<-data.frame(x,y) #simulated data
fit<-dw.reg(y~x,data=data.sim,para.q2=TRUE)
fit$tTable	
fit$survreg

#real example
library(Ecdat)
data(StrikeNb)
fit<-dw.reg(strikes~output,data=StrikeNb,para.q2=TRUE)
fit$tTable
fit$survreg



