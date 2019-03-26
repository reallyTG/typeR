library(SDraw)


### Name: srs.polygon
### Title: Draws a Simple Random Sample (SRS) from an area resource
###   (polygons).
### Aliases: srs.polygon
### Keywords: design survey

### ** Examples


# A square grid oriented east-west
WA.samp <- srs.polygon( WA, 100 )   
plot( WA )
points( WA.samp, pch=16 )





