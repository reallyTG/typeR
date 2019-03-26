library(plgp)


### Name: rectscale
### Title: Un/Scale data in a bounding rectangle
### Aliases: rectscale rectunscale
### Keywords: utilities

### ** Examples

X <- matrix(runif(10, 1, 3), ncol=2)
rect <- rbind(c(1,3), c(1,3))
Xs <- rectscale(X, rect)
rectunscale(Xs, rect)



