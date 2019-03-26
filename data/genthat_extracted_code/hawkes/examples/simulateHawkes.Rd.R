library(hawkes)


### Name: simulateHawkes
### Title: Hawkes process simulation Function
### Aliases: simulateHawkes

### ** Examples

#One dimensional Hawkes process
lambda0<-0.2
alpha<-0.5
beta<-0.7
horizon<-3600#one hour
h<-simulateHawkes(lambda0,alpha,beta,horizon)

#Multivariate Hawkes process
lambda0<-c(0.2,0.2)
alpha<-matrix(c(0.5,0,0,0.5),byrow=TRUE,nrow=2)
beta<-c(0.7,0.7)
horizon<-3600#one hour
h<-simulateHawkes(lambda0,alpha,beta,horizon)



