library(Momocs)


### Name: edm_nearest
### Title: Calculates the shortest euclidean distance found for every point
###   of one matrix among those of a second.
### Aliases: edm_nearest

### ** Examples

x <- matrix(1:10, nc=2)
edm_nearest(x, x+rnorm(10))
edm_nearest(x, x+rnorm(10), full=TRUE)



