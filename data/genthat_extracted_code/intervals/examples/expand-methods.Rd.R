library(intervals)


### Name: expand
### Title: Expand or contract intervals
### Aliases: expand expand,Intervals_virtual-method contract
###   contract,Intervals_virtual-method

### ** Examples

# Using adjustment to remove small gaps

x <- Intervals( c(1,10,100,8,50,200), type = "Z" )
close_intervals( contract( reduce( expand(x, 1) ), 1 ) )

# Finding points for which, as a result of possible floating point
# error, intersection may be ambiguous. Whether y1 intersects y2[2,]
# depends on precision.

delta <- .Machine$double.eps^0.5
y1 <- Intervals( c( .5, 1 - delta / 2 ) )
y2 <- Intervals( c( .25, 1, .75, 2 ) )

# Nominal 

interval_intersection( y1, y2 )

# Inner limit

inner <- interval_intersection(
                               contract( y1, delta, "relative" ),
                               contract( y2, delta, "relative" )
                               )

# Outer limit

outer <- interval_intersection(
                               expand( y1, delta, "relative" ),
                               expand( y2, delta, "relative" )
                               )

# The ambiguous set, corresponding to points which may or may not be in
# the intersection -- depending on numerical values for endpoints
# which are, with respect to relative difference, indistinguishable from
# the nominal values.

interval_difference( outer, inner )



