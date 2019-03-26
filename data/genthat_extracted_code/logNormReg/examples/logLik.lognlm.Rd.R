library(logNormReg)


### Name: logLik.lognlm
### Title: Log Likelihood for log Normal linear regression
### Aliases: logLik.lognlm
### Keywords: regression

### ** Examples

   ## No test: 
# o is the fit object, see ?lognlm
n=50
s=.4

#covariates
x<-seq(.1,10,l=n) 

#response
set.seed(1234)      #just to get reproducible results..
mu<- 10+.5*x  #linear regression function
y<-rlnorm(n, log(mu)-s^2/2, s) #data..

o<- lognlm(y~x) #the model

logLik(o) #the kernel log likelihood value
logLik(o, full=TRUE)
   
## End(No test)



