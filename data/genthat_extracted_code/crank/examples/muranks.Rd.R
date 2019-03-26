library(crank)


### Name: muranks
### Title: Complete a matrix of rankings
### Aliases: muranks
### Keywords: misc

### ** Examples

 # simulate ranking from the top with variable completion
 x<-matrix(NA,nrow=10,ncol=10)
 for(i in 1:10) {
  nx<-sample(2:10,1)
  xx<-sample(1:10,nx)
  x[i,xx]<-1:nx
 }
 x
 muranks(x)



