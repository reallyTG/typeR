library(intervals)


### Name: plot.Intervals
### Title: Plotting methods for interval objects
### Aliases: plot plot.Intervals plot.Intervals_full
###   plot,Intervals,missing-method plot,Intervals_full,missing-method
###   plot,Intervals,ANY-method plot,Intervals_full,ANY-method

### ** Examples

# Note plot symbol for empty interval in 'from'.

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
                  closed = c( FALSE, TRUE ),
                  type = "Z"
                  )

rownames(from) <- c("a","b","c","d","e")

to <- Intervals(
                matrix(
                       c(
                         2,  8,
                         3,  4,
                         5, 10
                         ),
                       ncol = 2, byrow = TRUE
                       ),
                closed = c( FALSE, TRUE  ),
                type = "Z"
                )

rownames(to) <- c("x","y","z")

empty(from)

plot(
     c(from,to),
     col = rep(1:2, c(nrow(from), nrow(to)))
     )

legend("topright", c("from","to"), col=1:2, lwd=1)

# More intervals. The maximal height shown is adapted to the plotting
# window.

B <- 10000
left <- runif( B, 0, 1e5 )
right <- left + rexp( B, rate = 1/10 )
x <- Intervals( cbind( left, right ) )

plot(x, use_points=FALSE)
plot(x, use_points=FALSE, xlim = c(0, 500))



