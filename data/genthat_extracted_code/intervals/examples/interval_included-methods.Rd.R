library(intervals)


### Name: interval_included
### Title: Assess inclusion of one set of intervals with respect to another
### Aliases: interval_included interval_included,Intervals,Intervals-method
###   interval_included,Intervals_full,Intervals_full-method

### ** Examples

# Note that 'from' and 'to' contain valid but empty intervals.

to <- Intervals(
               matrix(
                      c(
                        2,  6,
                        2,  8,
                        2,  9,
                        4,  4,
                        6,  8
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

from
to
interval_included(from, to)

closed(to) <- TRUE
to
interval_included(from, to)

# Intervals_full

F <- FALSE
T <- TRUE

to <- Intervals_full(
                     rep( c(2,8), c(4,4) ),
                     closed = matrix( c(F,F,T,T,F,T,F,T), ncol = 2 ),
                     type = "R"
                     )

type( from ) <- "R"
from <- as( from, "Intervals_full" )

from
to
interval_included(from, to)

# Testing

B <- 1000

x1 <- rexp( B, 1/1000 )
s1 <- runif( B, max=5 )
x2 <- rexp( B, 1/1000 )
s2 <- runif( B, max=3 )

from <- Intervals_full( cbind( x1, x1 + s1 ) )
to <- Intervals_full( cbind( x2, x2 + s2 ) )

ii <- interval_included( from, to )
ii_match <- which( sapply( ii, length ) > 0 )

from[ ii_match[1:3], ]
lapply( ii[ ii_match[1:3] ], function(x) to[x,] )

included <- to[ unlist( ii ), ]
dim( included )

interval_intersection( included, interval_complement( from ) )



