library(intervals)


### Name: clusters
### Title: Identify clusters in a collection of positions or intervals
### Aliases: clusters clusters,numeric-method
###   clusters,Intervals_virtual-method

### ** Examples

# Numeric method
w <- 20
x <- sample( 1000, 100 )
c1 <- clusters( x, w )

# Check results
sapply( c1, function( x ) all( diff(x) <= w ) )
d1 <- diff( sort(x) )
all.equal(
          as.numeric( d1[ d1 <= w ] ),
          unlist( sapply( c1, diff ) )
          )

# Intervals method, starting with a reduced object so we know that all
# intervals are disjoint and sorted.
B <- 100
left <- runif( B, 0, 1e4 )
right <- left + rexp( B, rate = 1/10 )
y <- reduce( Intervals( cbind( left, right ) ) )

gaps <- function(x) x[-1,1] - x[-nrow(x),2]
hist( gaps(y), breaks = 30 )

w <- 200
c2 <- clusters( y, w )
head( c2 )
sapply( c2, function(x) all( gaps(x) <= w ) )

# Clusters and open end points. See "Details".
z <- Intervals(
               matrix( 1:4, 2, 2, byrow = TRUE ),
               closed = c( TRUE, FALSE )
               )
z
clusters( z, 1 )
closed(z)[1] <- FALSE
z
clusters( z, 1 )



