library(NNS)


### Name: dy.d_
### Title: Partial Derivative dy/d_[wrt]
### Aliases: dy.d_
### Keywords: derivative multivaiate partial

### ** Examples

set.seed(123) ; x_1 <- runif(100) ; x_2 <- runif(100) ; y <- x_1 ^ 2 * x_2 ^ 2
B = cbind(x_1, x_2)
## To find derivatives of y wrt 1st regressor
dy.d_(B, y, wrt = 1, eval.points = c(.5, .5))

## Known function analysis: [y = a ^ 2 * b ^ 2]
x_1 <- seq(0, 1, .1) ; x_2 <- seq(0, 1, .1)
B = expand.grid(x_1, x_2) ; y <- B[ , 1] ^ 2 * B[ , 2] ^ 2
dy.d_(B, y, wrt = 1, eval.points = c(.5, .5), order = "max")



