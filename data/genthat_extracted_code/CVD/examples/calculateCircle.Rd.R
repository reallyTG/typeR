library(CVD)


### Name: calculateCircle
### Title: Generate points from a circle
### Aliases: calculateCircle
### Keywords: programming

### ** Examples

## Not run: 
##D # 100 points from a circle at c(0,0) with radius=200
##D a<-calculateCircle(0,0,200,100)
##D plot(a[,1],a[,2],xlim=c(-200,200),ylim=c(-200,200))
##D par(new=TRUE)
##D # 12 points from a circle at c(0,0) with radius=190, points between 0 and 90
##D # degrees
##D a<-calculateCircle(0,0,190,12,c(0,90))
##D plot(a[,1],a[,2],xlim=c(-200,200),ylim=c(-200,200),col='red')
##D par(new=TRUE)
##D # 12 points from a circle at c(0,0) with radius=180, points between 0 and 180
##D # degrees, uniform random distribution
##D a<-calculateCircle(0,0,180,12,c(0,180),TRUE)
##D plot(a[,1],a[,2],xlim=c(-200,200),ylim=c(-200,200),col='green')
##D par(new=TRUE)
##D # 12 points from a circle at c(0,0) with radius=170, points between 0 and 180
##D # degrees, normal random distribution
##D a<-calculateCircle(0,0,170,12,c(0,180),TRUE,rnorm)
##D plot(a[,1],a[,2],xlim=c(-200,200),ylim=c(-200,200),col='blue')
## End(Not run)



