library(hawkes)


### Name: jumpAutocorrelation
### Title: Autocorrelation of Hawkes process jumps on nonoverlapping time
###   intervals with lag.
### Aliases: jumpAutocorrelation

### ** Examples

#One dimensional Hawkes process
lambda0<-0.02
alpha<-0.05
beta<-0.06
tau<-60#one minute
lag<-0#adjacent non overlappingintervals
h<-jumpAutocorrelation(lambda0,alpha,beta,tau,lag)

#Multivariate Hawkes process
lambda0<-c(0.02,0.02)
alpha<-matrix(c(0.05,0,0,0.05),byrow=TRUE,nrow=2)
beta<-c(0.06,0.06)
tau<-60#one minute
lag<-0#adjacent non overlappingintervals
h<-jumpAutocorrelation(lambda0,alpha,beta,tau,lag)



