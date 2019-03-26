library(intervals)


### Name: distance_to_nearest
### Title: Compute distance to nearest position in a set of intervals
### Aliases: distance_to_nearest
###   distance_to_nearest,Intervals_virtual_or_numeric,Intervals_virtual_or_numeric-method

### ** Examples

# Point to interval

to <- Intervals( c(0,5,3,Inf) )
from <- -5:10
plot( from, distance_to_nearest( from, to ), type = "l" ) 
segments( to[,1], 1, pmin(to[,2], par("usr")[2]), 1, col = "red" )

# Interval to interval

from <- Intervals( c(-Inf,-Inf,3.5,-1,1,4) )
distance_to_nearest( from, to )



