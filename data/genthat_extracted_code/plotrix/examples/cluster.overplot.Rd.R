library(plotrix)


### Name: cluster.overplot
### Title: Shift overlying points into clusters
### Aliases: cluster.overplot
### Keywords: misc

### ** Examples

 xy.mat<-cbind(sample(1:10,200,TRUE),sample(1:10,200,TRUE))
 clusteredpoints<-
  cluster.overplot(xy.mat,col=rep(c("red","green"),each=100),
  away=rep(0.2,2))
 plot(clusteredpoints,col=clusteredpoints$col,
  main="Cluster overplot test")



