library(IntLik)


### Name: IntLik-package
### Title: Numerical Integration for Integrated Likelihood
### Aliases: IntLik-package IntLik
### Keywords: package

### ** Examples

##Integrated Likelihood for Ratio of Normal Mean (Example 2 in Severini 2007)
##Generating Data
n=10
u1=4
u2=1/5
x=rnorm(1,u1,sqrt(1/n))
y=rnorm(1,u2,sqrt(1/n))

##Calculate MLE for the start value
psi_hat=x/y
lambda_hat=(x*psi_hat+y)/(psi_hat^2+1)

#Define prior function
prior=function(lambda,psi){
dnorm((psi^2+1)*lambda/(psi*psi_hat+1),mean=0,sd=1)*(psi^2+1)/(psi*psi_hat+1)
}


#Define Likelihood
L=function(psi,lambda){
L=n/2/pi*exp(-n/2*((x-psi*lambda)^2+(y-lambda)^2))
L
}

#Estimate the Integrated Likelihood evaluated at a sequence of psi 
ILik(L,prior, start=lambda_hat, seq(psi_hat-10,psi_hat+10,1), 1, "Normal")




