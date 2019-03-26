library(ProjectManagement)


### Name: last.time
### Title: Last time for a deterministic projects
### Aliases: last.time

### ** Examples

precedence<-matrix(c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
duration<-c(3,2,1,1.5,4.2)
early.times<-c(0,0,3.5,2,0)
last.time(precedence,duration,early.times)



