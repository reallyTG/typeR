library(MotilityLab)


### Name: interpolateTrack
### Title: Interpolate Track Positions
### Aliases: interpolateTrack

### ** Examples

## Compare interpolated and non-interpolated versions of a track
bb <- boundingBox( TCells[2] )
plot( TCells[2] )
t2i <- interpolateTrack(TCells[[2]], seq(bb[1,"t"],bb[2,"t"],length.out=100),"spline")
plot( tracks( t2i ), add=TRUE, col=2 )



