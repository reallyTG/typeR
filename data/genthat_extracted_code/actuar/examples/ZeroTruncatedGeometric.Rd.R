library(actuar)


### Name: ZeroTruncatedGeometric
### Title: The Zero-Truncated Geometric Distribution
### Aliases: ZeroTruncatedGeometric ZTGeometric dztgeom pztgeom qztgeom
###   rztgeom
### Keywords: distribution

### ** Examples

p <- 1/(1 + 0.5)
dztgeom(c(1, 2, 3), prob = p)
dgeom(c(1, 2, 3), p)/pgeom(0, p, lower = FALSE) # same
dgeom(c(1, 2, 3) - 1, p)                        # same

pztgeom(1, prob = 1)        # point mass at 1

qztgeom(pztgeom(1:10, 0.3), 0.3)



