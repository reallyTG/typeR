library(pgirmess)


### Name: findR
### Title: Computes the distance between the centroid and the most distant
###   coordinate of a geographical coordinate set
### Aliases: findR
### Keywords: spatial

### ** Examples


mydata<-cbind(x=rnorm(20),y=rnorm(20))
radius<-findR(mydata)
centroid<-matrix(colMeans(mydata),ncol=2)
plot(mydata,asp=1)
points(centroid,pch=19,col="red",cex=2)
polygon(polycirc(radius,centroid),border="red")



