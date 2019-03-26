library(ProjectManagement)


### Name: early.time
### Title: Early time for a deterministic projects
### Aliases: early.time

### ** Examples

precedence<-matrix(c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
duration<-c(3,2,1,1.5,4.2)
early.time(precedence,duration)



