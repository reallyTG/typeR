library(intervals)


### Name: c
### Title: Combine different interval matrix objects
### Aliases: c c.Intervals c.Intervals_full

### ** Examples

f1 <- Intervals( 1:2, type = "Z" )
g1 <- open_intervals( f1 + 5 )

# Combining Intervals objects over Z may require closure adjustment
c( f1, g1 )

f2 <- f1; g2 <- g1
type( f2 ) <- type( g2 ) <- "R"

# Combine Intervals objects over R which have different closure requires
# coercion

h <- c( f2, g2 )

# Coercion for mixed combinations as well
c( h, g2 + 10 )

## Not run: 
##D # Combining different types is not permitted
##D c( h, g1 + 10 )
## End(Not run)




