library(GpGp)


### Name: order_dist_to_point
### Title: Distance to specified point ordering
### Aliases: order_dist_to_point

### ** Examples

n <- 100             # Number of locations
d <- 2               # dimension of domain
locs <- matrix( runif(n*d), n, d )
loc0 <- c(1/2,1/2)
ord <- order_dist_to_point(locs,loc0)



