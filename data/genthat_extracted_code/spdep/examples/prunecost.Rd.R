library(spdep)


### Name: prunecost
### Title: Compute cost of prune each edge
### Aliases: prunecost
### Keywords: graphs cluster

### ** Examples

d <- data.frame(a=-2:2, b=runif(5))
e <- matrix(c(1,2, 2,3, 3,4, 4,5), ncol=2, byrow=TRUE)

sum(sweep(d, 2, colMeans(d))^2)

prunecost(e, d)



