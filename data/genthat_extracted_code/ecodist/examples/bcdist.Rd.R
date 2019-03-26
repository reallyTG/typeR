library(ecodist)


### Name: bcdist
### Title: Bray-Curtis distance
### Aliases: bcdist
### Keywords: multivariate

### ** Examples

data(graze)
system.time(graze.bc <- bcdist(graze[, -c(1:2)]))
# equivalent to but much faster than:
system.time(graze.bc2 <- distance(graze[, -c(1:2)], "bray-curtis"))

all.equal(graze.bc, graze.bc2)




