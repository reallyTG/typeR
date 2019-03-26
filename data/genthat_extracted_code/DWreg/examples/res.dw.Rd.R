library(DWreg)


### Name: res.dw
### Title: DW regression: Diagnostics
### Aliases: res.dw
### Keywords: res.dw

### ** Examples


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
res.dw(fit,k=5)
ks.test(fit$residuals,"pnorm")

#real example
library(Ecdat)
data(StrikeNb)
fit<-dw.reg(strikes~output,data=StrikeNb,para.q2=TRUE)
res.dw(fit,k=5)
ks.test(fit$residuals,"pnorm")



