library(crank)


### Name: meanranks
### Title: Calculate mean ranks with possible missing values
### Aliases: meanranks
### Keywords: misc

### ** Examples

 # simulate "best/worst" ranking
 x<-matrix(NA,nrow=10,ncol=10)
 for(i in 1:10) {
  nbest<-sample(2:5,1)
  best<-1:nbest
  nworst<-sample(1:5,1)
  worst<-(11-nworst):10
  rankpos<-sample(1:10,nbest+nworst)
  x[i,rankpos]<-c(best,worst)
 }
 x
 meanranks(x)



