library(spectralGP)


### Name: image_plot
### Title: Draws image plot with a legend strip for the color scale.
### Aliases: image_plot
### Keywords: hplot

### ** Examples

x<- 1:10 
y<- 1:15 
z<- outer( x,y,"+") 
image_plot(x,y,z) 
# now add some points on diagonal  
points( 5:10, 5:10)
#
#fat (5% of figure) and short (50% of figure)  legend strip on the bottom 
image_plot( x,y,z,legend.width=.05, legend.shrink=.5, horizontal=TRUE) 

# add a legend on the bottom but first change margin for some room 
par( mar=c(10,5,5,5))

image( x,y,z)
image_plot( zlim=c(0,25), legend.only=TRUE, horizontal=TRUE) 



