library(GpGp)


### Name: order_middleout
### Title: Middle-out ordering
### Aliases: order_middleout

### ** Examples

n <- 100             # Number of locations
d <- 2               # dimension of domain
locs <- matrix( runif(n*d), n, d )
ord <- order_middleout(locs)



