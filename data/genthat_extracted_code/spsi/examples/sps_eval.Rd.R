library(spsi)


### Name: sps_eval
### Title: Evaluates spline on given points
### Aliases: sps_eval
### Keywords: Costantini spline interpolation

### ** Examples

## Univariate example
x <- c( 1, 2, 3, 4, 5, 6)
y <- c(16 ,18, 21, 17, 15, 12)
spline <- sps_prep(x, y, shape = 'monotonicity', smoothness = 2)
plot(seq(1, 6, 0.1), sps_eval(spline, seq(1, 6, 0.1)))

## Bivariate example

fun <- function(x,y) pmax(0, sin(pi*x) * sin(pi*y))

X <- seq(-1, 2, 0.5)
Y <- seq(-1, 1, 0.5)
grid <- mesh(X, Y)

Z <- matrix(fun(grid$x, grid$y), ncol = length(Y))

X_ <- seq(-1, 2, 0.05)
Y_ <- seq(-1, 1, 0.05)

# Prepare spline parameters
spline <- sps_prep(X, Y, Z)

# evaluate spline on grid of tabulation points spanned by X_ and Y_
eval <- sps_eval(spline, x = X_, y = Y_, grid = TRUE)

# Plot resulting data
persp3D(X_, Y_, eval)




