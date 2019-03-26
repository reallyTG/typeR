library(MotilityLab)


### Name: tracks
### Title: Tracks Objects
### Aliases: as.tracks as.tracks.list c.tracks is.tracks tracks

### ** Examples

## A single 1D track
x <- tracks( matrix(c(0, 8,  
10, 9, 
20, 7, 
30, 7,
40, 6, 
50, 5), ncol=2, byrow=TRUE ) )

## Three 3D tracks
x2 <- tracks( rbind(
 c(0,5,0), c(1,5,3), c(2,1,3), c(3,5,6) ),
 rbind( c(0,1,1),c(1,1,4),c(2,5,4),c(3,5,1),c(4,-3,1) ),
 rbind( c(0,7,0),c(1,7,2),c(2,7,4),c(3,7,7) ) )




