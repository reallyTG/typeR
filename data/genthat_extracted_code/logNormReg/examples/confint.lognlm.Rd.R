library(logNormReg)


### Name: confint.lognlm
### Title: Confidence intervals for the parameters in log normal regression
### Aliases: confint.lognlm
### Keywords: regression nonlinear

### ** Examples

## No test: 

n=50
s=.4
set.seed(1515)      #just to get reproducible results..

#covariates
x<-seq(.1,10,l=n) 
z<-rnorm(n)

#response
mu<- 10+.5*x- z  #linear regression function
y<-rlnorm(n, log(mu)-s^2/2, s) #data..

o<- lognlm(y~x+z) #the model

confint(o, "x", type="g")
confint(o, "z", type="w") #same than confint.default(o) 
## End(No test)



