library(intervals)


### Name: close_intervals
### Title: Re-represent integer intervals with open or closed endpoints
### Aliases: close_intervals close_intervals,Intervals_virtual-method
###   open_intervals open_intervals,Intervals_virtual-method adjust_closure
###   adjust_closure,Intervals-method adjust_closure,Intervals_full-method

### ** Examples

x <- Intervals(
               c( 1, 5, 10, 1, 6, 20 ),
               closed = c( TRUE, FALSE ),
               type = "Z"
               )

# Empties are dropped
close_intervals(x)
adjust_closure(x, FALSE, TRUE)

# Intervals_full
y <- as( x, "Intervals_full" )
closed(y)[1,2] <- TRUE
open_intervals(y)



