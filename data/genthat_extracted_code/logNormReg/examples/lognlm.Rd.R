library(logNormReg)


### Name: lognlm
### Title: Multiple linear regression with log Normal errors
### Aliases: lognlm
### Keywords: regression ~kwd2

### ** Examples


n=200
s=.4
set.seed(1234)      #just to get reproducible results..

x<-seq(.1,10,l=n) #covariate
mu<- 10+2*x  #linear regression function
y<-rlnorm(n, log(mu)-s^2/2, s) #data..

o0<-lm(log(y)~x) #the usual but WRONG model
o<- lognlm(y~x) #fit the 'right' model

plot(x,y)
lines(x, mu, lwd=2)
points(x, exp(fitted(o0)), col=2, type="l", lwd=2)
points(x, fitted(o), col=3, type="l", lwd=2)
legend("topleft", legend=c("true", "lm(log(y)~x)", "lognlm(y~x)"), 
    col=c(1,2,3), lwd=2)

#Sometimes people would estimate parameters by minimizing a least square objective 
# (i.e. by setting 'lik=FALSE', see Details), wherein data would come from 
# Y = mu * exp(eps) where eps~N(0,s)..
y1<-mu*exp(rnorm(n,0,1)) #data..
o1<-lognlm(y1~x, lik=FALSE) #set 'lik=FALSE', see Details





