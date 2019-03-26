library(raster)


### Name: overlay
### Title: Overlay Raster objects
### Aliases: overlay overlay,Raster,Raster-method
###   overlay,Raster,missing-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
r1 <- init(r, fun=runif)
r2 <- init(r, fun=runif)
r3 <- overlay(r1, r2, fun=function(x,y){return(x+y)})

# long version for multiplication
r4 <- overlay(r1, r2, fun=function(x,y){(x*y)} )

#use the individual layers of a RasterStack to get a RasterLayer
s <- stack(r1, r2)
r5 <- overlay(s, fun=function(x,y) x*y )
# equivalent to
r5c <- calc(s, fun=function(x) x[1]*x[2] )


#Combine RasterStack and RasterLayer objects (s2 has four layers. 
# r1 (one layer) and s (two layers) are recycled) 
s2 <- stack(r1, r2, r3, r4)
b <- overlay(r1, s, s2, fun=function(x,y,z){return(x*y*z)} )

# use a single RasterLayer (same as calc function)
r6 <- overlay(r1, fun=sqrt)

# multiplication with more than two layers 
# (make sure the number of RasterLayers matches the arguments of 'fun')
r7 <- overlay(r1, r2, r3, r4, fun=function(a,b,c,d){return(a*b+c*d)} )  
# equivalent function, efficient if values can be loaded in memory
r8 <- r1 * r2 + r3 * r4

# Also works with multi-layer objects. 
s1 <- stack(r1, r2, r3)
x <- overlay(s1, s1, fun=function(x,y)x+y+5)

# in this case the first layer of the shorter object is recycled.
# i.e., s2 is treated as stack(r1, r3, r1)
s2 <- stack(r1, r3)
y <- overlay(s1, s2, fun=sum)



