library(SDraw)


### Name: bas.line
### Title: Draws a Balanced Acceptance Sample (BAS) from a linear resource
###   (line).
### Aliases: bas.line
### Keywords: design survey

### ** Examples


#   Draw sample of Hawaii coastline
#   This takes approximately 60 seconds to run
samp <- bas.line( HI.coast, 50 )
plot(HI.coast)
points( samp, pch=16, col="red" )





