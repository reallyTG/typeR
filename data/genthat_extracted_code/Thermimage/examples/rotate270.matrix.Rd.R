library(Thermimage)


### Name: rotate270.matrix
### Title: Rotate a matrix by 270 degrees counterclockwise (or 90 degree
###   clockwise).  Used for adjusting image plotting in R.
### Aliases: rotate270.matrix

### ** Examples


## The function is currently defined as
function (x) 
{
    mirror.matrix(t(x))
  }
  
  

 set.seed(5)
 par(mfrow=c(1,2),mar=c(1,1,1,1))
 r<-c(1:100,rnorm(1:100)*10,1:100)
 m<-matrix(r,50)
 image(m, axes=FALSE)
 box()
 text(.5,.5,"Matrix",col="white")
 mf<-rotate270.matrix(m)
 image(mf,axes=FALSE)
 box()
 text(.5,.5,"Rotate270",col="white")
  



