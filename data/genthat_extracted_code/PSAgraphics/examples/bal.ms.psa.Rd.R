library(PSAgraphics)


### Name: bal.ms.psa
### Title: Balance for Continuous Covariate: Random Strata as part of a PSA
### Aliases: bal.ms.psa
### Keywords: htest

### ** Examples
#Balance stat should be close to zero
meas<-rnorm(500)
continuous<-c(meas,meas+rnorm(500,0,.1))
treatment<-c(rep(0,500),rep(1,500))
strata<-rep(c(rep(1,100),rep(2,100),rep(3,100),rep(4,100),rep(5,100)),2)
bal.ms.psa(continuous,treatment,strata)


#Balance stat should be close to .4
meas<-rnorm(500)
continuous<-c(meas, meas[1:250] + runif(250,0,.2), 
   meas[251:500]-runif(250,0,.2))
treatment<-c(rep(0,500),rep(1,500))
strata<-rep(c(rep(1,100), rep(2,100), rep(3,100), 
   rep(4,100),rep(5,100)),2)
bal.ms.psa(continuous, treatment, strata, B=200)



