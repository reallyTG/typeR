library(SDraw)


### Name: srs.line
### Title: Draw a Simple Random Sample (SRS) from a linear resource.
### Aliases: srs.line
### Keywords: design survey

### ** Examples


# Draw fixed number of equi-distant points
HI.samp <- srs.line( HI.coast, 100 )   
plot( HI.coast, col=rainbow(length(HI.coast)) )
points( HI.samp, col="red", pch=16 )

# Inspect attributes of points with HI.samp@data




