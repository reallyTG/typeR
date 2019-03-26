library(logNormReg)


### Name: vcov.lognlm
### Title: Covariance matrix for lognlm fits
### Aliases: vcov.lognlm
### Keywords: regression

### ** Examples

## No test: 
n=50
s=.3
set.seed(1515)      #just to get reproducible results..

#covariates
x<-seq(.1,10,l=n) 
z<-rnorm(n)

#response
mu<- 10+.5*x- z  #linear regression function
y<-rlnorm(n, log(mu)-s^2/2, s) #data..

o<- lognlm(y~x+z) #the model
vcov(o) #the full covariance matrix 
vcov(o, se=TRUE, sandw=TRUE) #st.errs only, based on the sandwich formula 

o<- lognlm(y~x+z, lik=FALSE) #min. distance estimation
vcov(o, se=TRUE) #'sandw=TRUE' is not allowed if the fit has been obtained with 'lik=FALSE'

 
## End(No test)



