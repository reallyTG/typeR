library(GpGp)


### Name: order_coordinate
### Title: Sorted coordinate ordering
### Aliases: order_coordinate

### ** Examples

n <- 100             # Number of locations
d <- 2               # dimension of domain
locs <- matrix( runif(n*d), n, d )
ord1 <- order_coordinate(locs, 1 )
ord12 <- order_coordinate(locs, c(1,2) )



