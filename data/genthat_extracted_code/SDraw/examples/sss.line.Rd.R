library(SDraw)


### Name: sss.line
### Title: Draw a Simple Systematic Sample (SSS) from a linear resource.
### Aliases: sss.line
### Keywords: design survey

### ** Examples


# Draw fixed number of equi-distant points
HI.samp <- sss.line( HI.coast, 100 )   
plot( HI.coast, col=rainbow(length(HI.coast)) )
points( HI.samp, col="red", pch=16 )

# Draw points every 20 km along Hawaii's coastline
HI.samp <- sss.line( HI.coast, spacing=20000 )   
plot( HI.coast, col=rainbow(length(HI.coast)) )
points( HI.samp, col="red", pch=16 )

# Inspect attributes of points with HI.samp@data




