library(NNS)


### Name: dy.dx
### Title: Partial Derivative dy/dx
### Aliases: dy.dx
### Keywords: derivative partial

### ** Examples

x <- seq(0, 2 * pi, pi / 100) ; y <-sin(x)
dy.dx(x, y, eval.point = 1.75)

# Vector of derivatives
dy.dx(x, y, eval.point = c(1.75, 2.5), deriv.method = "FS")



