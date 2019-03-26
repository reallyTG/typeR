library(ProjectManagement)


### Name: delay.pert
### Title: Problems of distribution of delay in deterministic projects
### Aliases: delay.pert

### ** Examples

precedence<-matrix(c(0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
duration<-c(2,1,1,4,2)
observed.duration<-c(2.5,1.25,2,4.5,3)
delta<-6.5
delay.pert(duration,precedence,observed.duration,delta)



