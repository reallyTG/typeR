library(functional)


### Name: Negate
### Title: Negate a function; borrowed from src/library/base/R/funprog.R
###   for pre-2.7 Rs.
### Aliases: Negate

### ** Examples

is.even <- function(a) a%%2 == 0
is.odd <- Negate(is.even)
stopifnot(Reduce(`&&`, Map(is.odd, c(1, 3, 5))))



