library(Thermimage)


### Name: rotate90.matrix
### Title: Rotate a matrix by 90 degrees counterclockwise (270 degrees
###   clockwise). Used for adjusting image plotting in R.
### Aliases: rotate90.matrix

### ** Examples


## The function is currently defined as
function (x) 
{
    t(mirror.matrix(x))
  }
  
set.seed(5)
par(mfrow=c(1,2),mar=c(1,1,1,1))
r<-c(1:100,rnorm(1:100)*10,1:100)
m<-matrix(r,50)
image(m, axes=FALSE)
box()
text(.5,.5,"Matrix",col="white")
mf<-rotate90.matrix(m)
image(mf,axes=FALSE)
box()
text(.5,.5,"Rotate90",col="white")
  



