library(ProjectManagement)


### Name: delay.stochastic.pert
### Title: Problems of distribution of delay in stochastic projects
### Aliases: delay.stochastic.pert

### ** Examples


precedence<-matrix(c(0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
distribution<-c("TRIANGLE","TRIANGLE","TRIANGLE","TRIANGLE","EXPONENTIAL")
values<-matrix(c(1,3,2,1/2,3/2,1,1/4,9/4,1/2,3,5,4,1/2,0,0),nrow=5,byrow=TRUE)
observed.duration<-c(2.5,1.25,2,4.5,3)
percentile<-NULL
delta<-6.5
delay.stochastic.pert(precedence,distribution,values,observed.duration,percentile,delta,10000)




