library(sphet)


### Name: distance
### Title: Writes distance matrices
### Aliases: distance distance.matrix
### Keywords: spatial

### ** Examples

X<-runif(100,0,70)
Y<-runif(100,-30,20)
coord1<-cbind(seq(1,100),X,Y)
thm2 <- distance(coord1,region.id=NULL,output=FALSE,type="NN", nn=6)
thm2 <- distance(coord1,region.id=NULL,output=FALSE,type="distance", cutoff=1)



