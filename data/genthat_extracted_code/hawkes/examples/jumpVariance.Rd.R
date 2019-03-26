library(hawkes)


### Name: jumpVariance
### Title: Variance of Hawkes process jumps.
### Aliases: jumpVariance

### ** Examples

#One dimensional Hawkes process
lambda0<-0.02
alpha<-0.05
beta<-0.06
tau<-60#one minute
h<-jumpVariance(lambda0,alpha,beta,tau)

#Multivariate Hawkes process
lambda0<-c(0.02,0.02)
alpha<-matrix(c(0.05,0,0,0.05),byrow=TRUE,nrow=2)
beta<-c(0.06,0.06)
tau<-60#one minute
h<-jumpVariance(lambda0,alpha,beta,tau)



