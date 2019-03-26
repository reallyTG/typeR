library(ProjectManagement)


### Name: organize
### Title: Organize project activities
### Aliases: organize

### ** Examples

precedence<-matrix(c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0),nrow=5,ncol=5,byrow=TRUE)
organize(precedence)



