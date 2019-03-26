library(ltsa)


### Name: DLResiduals
### Title: Prediction residuals
### Aliases: DLResiduals
### Keywords: ts

### ** Examples

# For the AR(1) the prediction residuals and innovation residuals are the same (except for
# t=1).  In this example we demonstrate the equality of these two types of residuals.
#
phi<-0.8
sde<-30
n<-30
z<-arima.sim(n=30,list(ar=phi),sd=sde)
r<-phi^(0:(n-1))/(1-phi^2)*sde^2
e<-DLResiduals(r,z)
a<-numeric(n)
for (i in 2:n)
    a[i]=z[i]-phi*z[i-1]
a<-a/sde
ERR<-sum(abs(e[-1]-a[-1]))
ERR
#
#Simulate AR(1) and compute the MLE for the innovation variance
phi <- 0.5
n <- 2000
sigsq <- 9
z<-arima.sim(model=list(ar=phi), n=n, sd=sqrt(sigsq))
g0 <- sigsq/(1-phi^2)
r <- g0*phi^(0:(n-1))
#comparison of estimate with actual
e<-DLResiduals(r,z,useC=FALSE, StandardizedQ=FALSE)
sigsqHat <- var(e)
ans<-c(sigsqHat,sigsq)
names(ans)<-c("estimate","theoretical")
ans



