library(fields)


### Name: tim.colors
### Title: Some useful color tables for images and tools to handle them.
### Aliases: tim.colors larry.colors two.colors designer.colors color.scale
###   fieldsPlotColors
### Keywords: aplot

### ** Examples


tim.colors(10) 
# returns an array of 10 character strings encoding colors in hex format

# e.g. (red, green,  blue) values of   (16,255, 239)
#   translates to "#10FFEF" 
# rgb( 16/255, 255/255, 239/255, alpha=.5)
#   gives   "#10FFEF80"  note extra "alpha channel"

# veiw some color table choices
set.panel( 2,3)
z<- outer( 1:20,1:20, "+")
obj<- list( x=1:20,y=1:20,z=z )

image( obj, col=tim.colors( 200)) # 200 levels

image( obj, col=two.colors() )

# using tranparency without alpha the image plot would cover points
plot( 1:20,1:20)
image(obj, col=two.colors(alpha=.5), add=TRUE)

coltab<- designer.colors(col=c("blue", "grey", "green"),
                   x= c( 0,.3,1) ) 
image( obj, col= coltab )

# peg colors at some desired quantiles  of data.
# NOTE need 0 and 1 for the color scale to make sense
x<- quantile( c(z), c(0,.25,.5,.75,1.0) )
# scale these to [0,1]
zr<- range( c(z))
x<- (x-zr[1])/ (zr[2] - zr[1])  

coltab<- designer.colors(256,rainbow(5), x)
image( z, col= coltab )
# see image.plot for adding all kinds of legends

# some random color values
set.seed(123)
z<- rnorm(100)
hex.codes<- color.scale(z, col=two.colors())
N<-length( hex.codes)
# take a look at the coded values
# or equivalently create some Xmas wrapping paper!
image( 1:N, N, matrix(1:N, N,1) , col=hex.codes, axes=FALSE,
                               xlab="", ylab="")

set.panel()




