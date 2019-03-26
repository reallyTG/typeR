library(fields)


### Name: plot.surface
### Title: Plots a surface
### Aliases: plot.surface
### Keywords: hplot

### ** Examples

x<- seq( -2,2,,80)
y<- seq( -2,2,,80)
# a lazy way to create some test image
z<- outer( x,y, "+")

# create basic image/surface object
obj<- list(x=x, y=y,z=z)

# basic contour plot
# note how graphical parameters appropriate to contour are passed
plot.surface( obj, type="c", col="red")

# using a fields function to fit a surface and evaluate as surface object.
fit<- Tps( BD[,1:4], BD$lnya) # fit surface to data 
# surface of variables 2 and 3 holding 1 and 4 fixed at their median levels
 out.p<-predictSurface(fit, xy=c(2,3))  

 plot.surface(out.p) # surface plot  




