library(Thermimage)


### Name: flip.matrix
### Title: Flips a matrix 'left-right'.  Used in re-arranging image data
###   for plotting properly in R.
### Aliases: flip.matrix

### ** Examples

## The function is currently defined as
function (x) 
{
    mirror.matrix(rotate180.matrix(x))
  }


par(mfrow=c(1,2),mar=c(1,1,1,1))
r<-c(1:100,rnorm(1:100)*10,1:100)
m<-matrix(r,20)
image(m, axes=FALSE)
box()
text(.5,.5,"Matrix",col="white")
mf<-flip.matrix(m)
image(mf,axes=FALSE)
box()
text(.5,.5,"Flipped",col="white")
  



