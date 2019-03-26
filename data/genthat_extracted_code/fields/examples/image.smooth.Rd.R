library(fields)


### Name: image.smooth
### Title: Kernel smoother for irregular 2-d data
### Aliases: image.smooth setup.image.smooth
### Keywords: smooth

### ** Examples

# first convert precip data to the 128X128 discretized image format ( with 
# missing  values to indicate where data is not observed) 
# 
out<- as.image( RMprecip$y, x= RMprecip$x, nx=128, ny=128) 
# out$z is the image matrix 

dx<- out$x[2]- out$x[1] 
dy<-  out$y[2] - out$y[1] 

#  
# grid scale in degrees and choose kernel bandwidth to be .25 degrees. 

look<- image.smooth( out, theta= .25)

# pass in a tophat kernel
topHat<- function( dd, h ){ ifelse( dd <= h^2, 1, 0)} 
## dd is the distance squared
look2<- image.smooth( out, kernel.function=topHat, h=.8)

image.plot(look) 
points( RMprecip$x)
US( add=TRUE, col="grey", lwd=2)

# to save on computation, decrease the padding with zeroes 
# only pad 32 grid points around the margins ofthe image. 

look<- image.smooth(out$z, dx=dx, dy=dy, theta= .25, xwidth=32*dx,ywidth=32*dy) 

# the range of these data is ~ 10 degrees  and so 
# with a padding of 32 grid points  32*( 10/128) =  2.5 
# about 10 standard deviations of the normal kernel so there is still 
# lots of room for padding  
# a minimal choice might be  xwidth = 4*(.25)= 1  4 SD for the normal kernel
# creating weighting object outside the call  
# this is useful when one wants to smooth different data sets but on the 
# same grid with the same kernel function 
# 

#
#  random fields from smoothing white noise with this filter.
#
set.seed(123)
test.image<- matrix( rnorm(128**2),128,128)
dx<- .1
dy<- .8

wght<- setup.image.smooth( nrow=128, ncol=128,  dx=dx, dy=dy,
             theta=.25, xwidth=2.5, ywidth=2.5)
#
look<- image.smooth( test.image, dx=dx, dy=dy, wght)

# NOTE:   this is the same as using 
#
#     image.smooth( test.image , 128,128), xwidth=2.5,
#                        ywidth=2.5, dx=dx,dy=dy, theta=.25)
#
#   but the call to image.smooth is faster because the fft of kernel
#   has been precomputed.



# periodic smoothing in the horizontal dimension

look<- image.smooth( test.image , xwidth=1.5,
                        ywidth=2.5, dx=dx,dy=dy, theta=1.5)
look2<- image.smooth( test.image , xwidth=0,
                        ywidth=2.5, dx=dx,dy=dy, theta=1.5)
# compare these two
set.panel( 1,2)
image.plot( look, legend.mar=7.1)
title("free boundaries")
image.plot( look2, legend.mar=7.1) # look for periodic continuity at edges!
title("periodic boundary in horizontal")
set.panel(1,1)




