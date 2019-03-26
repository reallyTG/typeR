library(intervals)


### Name: which_nearest
### Title: Identify nearest member(s) in a set of intervals
### Aliases: which_nearest which_nearest,numeric,Intervals_virtual-method
###   which_nearest,Intervals_virtual,Intervals_virtual-method
###   which_nearest,Intervals_virtual,numeric-method
###   which_nearest,numeric,numeric-method

### ** Examples

# Point to interval. Empty rows, or those with NA endpoints, do not
# generate hits. Note that distance_to_nearest can be 0 but without
# overlap, depending on endpoint closure.

to <- Intervals_full( c(-1,0,NA,5,-1,3,10,Inf) )
closed(to)[1,] <- FALSE
closed(to)[2,2] <- FALSE
from <- c( NA, -3:5 )

to
cbind( from, which_nearest( from, to ) )

# Completely empty to object

which_nearest( from, to[1,] )

# Interval to interval

from <- Intervals( c(-Inf,-Inf,3.5,-1,1,4) )
from
which_nearest( from, to )

# Checking behavior with ties

from <- Intervals_full( c(2,2,4,4,3,3,5,5) )
closed( from )[2:3,] <- FALSE
to <- Intervals_full( c(0,0,6,6,1,1,7,8) )
closed( to )[2:3,] <- FALSE

from
to
which_nearest( from, to )

from <- Intervals_full( c(1,3,6,2,4,7) )
to <- Intervals_full( c(4,4,5,5) )
closed( to )[1,] <- FALSE

from
to
which_nearest( from, to )



