library(hawkes)


### Name: likelihoodHawkes
### Title: Compute the likelihood function of a hawkes process
### Aliases: likelihoodHawkes

### ** Examples

#One dimensional Hawkes process
lambda0<-0.2
alpha<-0.5
beta<-0.7
history<-simulateHawkes(lambda0,alpha,beta,3600)
l<-likelihoodHawkes(lambda0,alpha,beta,history[[1]])

#Multivariate Hawkes process
lambda0<-c(0.2,0.2)
alpha<-matrix(c(0.5,0,0,0.5),byrow=TRUE,nrow=2)
beta<-c(0.7,0.7)
history<-simulateHawkes(lambda0,alpha,beta,3600)
l<-likelihoodHawkes(lambda0,alpha,beta,history)



