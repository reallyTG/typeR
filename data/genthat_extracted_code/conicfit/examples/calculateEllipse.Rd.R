library(conicfit)


### Name: calculateEllipse
### Title: Generate points from a ellipse
### Aliases: calculateEllipse
### Keywords: programming

### ** Examples

## Not run: 
##D # 50 points from an ellipse at c(0,0) with axis (200, 100), angle 45 degrees
##D a<-calculateEllipse(0,0,200,100,45,50)
##D plot(a[,1],a[,2],xlim=c(-250,250),ylim=c(-250,250))
##D par(new=T)
##D # 10 points from an ellipse at c(0,0) with axis (200, 100), angle 45 degrees,
##D #points between 0 and 180 # degrees, normal random distribution
##D b<-calculateEllipse(0,0,200,100,45,10,c(0,90))
##D plot(b[,1],b[,2],xlim=c(-250,250),ylim=c(-250,250),col='red')
##D par(new=T)
##D # 50 points from an ellipse at c(0,0) with axis (200, 100), angle 45 degrees
##D a<-calculateEllipse(0,0,200,100,45,50, randomDist=TRUE,noiseFun=function(x) 
##D (x+rnorm(1,mean=0,sd=10)))
##D plot(a[,1],a[,2],xlim=c(-250,250),ylim=c(-250,250),col='cyan')
## End(Not run)



