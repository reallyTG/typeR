library(ProjectManagement)


### Name: stochastic.pert
### Title: Stochastic projects
### Aliases: stochastic.pert

### ** Examples

precedence<-matrix(c(0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
distribution<-c("TRIANGLE","TRIANGLE","TRIANGLE","TRIANGLE","EXPONENTIAL")
values<-matrix(c(1,3,2,1/2,3/2,1,1/4,9/4,1/2,3,5,4,1/2,0,0),nrow=5,byrow=TRUE)
percentile<-0.95
stochastic.pert(precedence,distribution,values,percentile)




