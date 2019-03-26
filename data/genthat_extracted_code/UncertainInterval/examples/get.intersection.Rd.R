library(UncertainInterval)


### Name: get.intersection
### Title: get.intersection Obtain the intersection of two distributions
###   using the kernel method
### Aliases: get.intersection

### ** Examples

ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,2))
(get.intersection(ref, test)) # two intersections! Generates warning in other functions!



