library(spsi)


### Name: sps_prep
### Title: Prepare list of objects for shape preserving interpolation.
### Aliases: sps_prep
### Keywords: spline Costantini curvature monotonicity

### ** Examples


## Univariate example
x <- c( 1, 2, 3, 4, 5, 6)
y <- c(16 ,18, 21, 17, 15, 12)
spline <- sps_prep(x, y, shape = 'monotonicity', smoothness = 2)
plot(seq(1, 6, 0.1), sps_eval(spline, seq(1, 6, 0.1)))

## Bivariate example

tower <- function(x, y)
{
	X <- abs(x)
	Y <- abs(y)
	ifelse((X + Y) <= 1, floor(3*(1 - X - Y)),
	       ifelse(pmax(X, Y) >= 1, pmax(X, Y)/2 - 0.5,
                      0))
}

X <- Y <- seq(-1.25, 1.25, 2.5/13)
grid <- mesh(X, Y)
Z <- tower(grid$x, grid$y)

spline <- sps_prep(X, Y, Z)

X_ <- Y_ <- seq(-1.25, 1.25, 2.5/60)

persp3D(X_, Y_, sps_eval(spline, x = X_, y = Y_, grid = TRUE))




