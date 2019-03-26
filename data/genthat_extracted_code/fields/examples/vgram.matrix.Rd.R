library(fields)


### Name: vgram.matrix
### Title: Computes a variogram from an image
### Aliases: vgram.matrix plot.vgram.matrix
### Keywords: spatial

### ** Examples

# variogram for Lennon image.
data(lennon)
out<-vgram.matrix( lennon) 

plot( out$d, out$vgram, xlab="separation distance", ylab="variogram") 
# image plot of vgram values by direction.  

# look at different directions 
out<-vgram.matrix( lennon, R=8)  

plot( out$d, out$vgram) 
# add in different orientations 
points( out$d.full, out$vgram.full, col="red")

#image plot of variogram values for different directions. 
set.panel(1,1)
plot.vgram.matrix( out)
# John Lennon appears remarkably isotropic!




