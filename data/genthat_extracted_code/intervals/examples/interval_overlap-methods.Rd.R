library(intervals)


### Name: interval_overlap
### Title: Assess overlap from one set of intervals to another
### Aliases: interval_overlap
###   interval_overlap,Intervals_virtual_or_numeric,Intervals_virtual_or_numeric-method
###   interval_overlap,missing,ANY-method
###   interval_overlap,ANY,missing-method

### ** Examples

# Note that 'from' contains a valid but empty interval.

to <- Intervals(
               matrix(
                      c(
                        2,  8,
                        3,  4,
                        5, 10
                        ),
                      ncol = 2, byrow = TRUE
                      ),
               closed = c( TRUE, FALSE ),
               type = "Z"
               )

from <- Intervals(
               matrix(
                      c(
                         2,  8,
                         8,  9,
                         6,  9,
                        11, 12,
                         3,  3
                        ),
                      ncol = 2, byrow = TRUE
                      ),
               closed = c( TRUE, FALSE ),
               type = "Z"
               )
rownames(from) <- letters[1:nrow(from)]

empty(to)
empty(from)

interval_overlap(from, to)

# Non-empty real intevals of size 0 can overlap other intervals.

u <- to
type(u) <- "R"

v <- Intervals_full( rep(3,4) )
closed(v)[2,] <- FALSE
v
empty(v)
size(v)

interval_overlap(v, u)

# Working with points

interval_overlap( from, c( 2, 3, 6, NA ) )



