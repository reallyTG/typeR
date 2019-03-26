library(birtr)


### Name: tif
### Title: Test Information Function
### Aliases: tif
### Keywords: tif

### ** Examples

b <- c(-1.0, -0.5, 0.0, 0.5, 1.0)
a <- c(2.0, 1.5, 1.5, 1.5, 2.0)
c <- c(.2, .2, .2, .2, .2)
tif(b, a, c)
tif(a = a, b = b, c = c)
tif(b)    # tif(b, a = rep(1, length(b)), c = rep(0, length(b)))
tif(b, a) # tif(b, a, c = rep(0, length(b)))



