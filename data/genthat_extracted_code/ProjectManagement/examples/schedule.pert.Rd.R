library(ProjectManagement)


### Name: schedule.pert
### Title: Schedule for deterministic projects
### Aliases: schedule.pert

### ** Examples

precedence<-matrix(c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
duration<-c(3,2,1,1.5,4.2)
schedule.pert(duration,precedence)



