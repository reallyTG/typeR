library(SELF)


### Name: indicators
### Title: Calculate the f1,precision,recall score of the graph
### Aliases: indicators

### ** Examples

pred<-matrix(c(0,0,0,0,1,0,1,1,0),nrow=3,ncol=3)
real<-matrix(c(0,0,0,0,1,0,1,0,0),nrow=3,ncol=3)
indicators(pred,real)



