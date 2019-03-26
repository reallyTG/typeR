library(mixtools)


### Name: aug.x
### Title: Augmented Predictor Function
### Aliases: aug.x
### Keywords: internal

### ** Examples

x <- matrix(1:30, nrow = 10)
cp <- c(1, 3, 0)
cp.locs <- c(3, 12, 14, 16)
d <- rep(0, 4)
x1 <- aug.x(x, cp.locs, cp, delta = NULL)
x1
x2 <- aug.x(x, cp.locs, cp, delta = d)
x2



