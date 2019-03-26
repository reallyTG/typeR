library(Thermimage)


### Name: rotate180.matrix
### Title: Rotate a matrix by 180 degrees.  Used for adjusting image
###   plotting in R.
### Aliases: rotate180.matrix

### ** Examples


## The function is currently defined as
function (x) 
{
    xx <- rev(x)
    dim(xx) <- dim(x)
    xx
  }
  
  
# set.seed(5)
# par(mfrow=c(1,2),mar=c(1,1,1,1))
# r<-c(1:100,rnorm(1:100)*10,1:100)
# m<-matrix(r,50)
# image(m, axes=FALSE)
# box()
# text(.5,.5,"Matrix")
# mf<-rotate180.matrix(m)
# image(mf,axes=FALSE)
# box()
# text(.5,.5,"Rotate180",col="white")
  
  



