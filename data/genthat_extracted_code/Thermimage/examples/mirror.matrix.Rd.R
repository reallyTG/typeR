library(Thermimage)


### Name: mirror.matrix
### Title: Mirrors a matrix upside-down.  Used in re-arranging image data
###   for plotting properly in R.
### Aliases: mirror.matrix

### ** Examples


## The function is currently defined as
function (x) 
{
    xx <- as.data.frame(x)
    xx <- rev(xx)
    xx <- as.matrix(xx)
    xx
  }
  

# par(mfrow=c(2,1),mar=c(1,1,1,1))
# r<-c(1:100,rnorm(1:100)*10,1:100)
# m<-matrix(r,50)
# image(m, axes=FALSE)
# box()
# text(.5,.5,"Matrix",col="white")
# mf<-mirror.matrix(m)
# image(mf,axes=FALSE)
# box()
# text(.5,.5,"Mirror",col="white")



