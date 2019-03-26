library(spsi)


### Name: sps_fun
### Title: Shape Preserving Bi-variate and Uni-variate Interpolation.
### Aliases: sps_fun sps_interpolate
### Keywords: spline Costantini curvature monotonicity

### ** Examples


## Example 1

# Following example shows usage of sps_fun along with the parameter 'smoothness'.
# As you will see if smoothness = 2 then first derivative of function is differentiable
# everywhere.

x <- c( 1, 2, 3, 4, 5, 6)
y <- c(16 ,18, 21, 17, 15, 12)

evalK1 <- sps_fun(x, y)
derK1 <- sps_fun(x, y, der.x=1)

evalK2 <- sps_fun(x, y, smoothness = 2)
derK2 <- sps_fun(x, y, smoothness = 2, der.x = 1)

xs <- seq(1, 6, 0.01)
par(mfrow = c(2, 2))
plot(x, y, col = "red", xlim = c(0, 7), ylim = c(10, 22),
     main = "Spline, smoothness = 1")
grid()

lines(xs,evalK1(xs), col="cyan")
par(new = TRUE)
plot(derK1, from = 1,to = 6, col = "magenta", xlim = c(0,7), ylim = c(-6,5),
    xaxt = 'n',yaxt='n',ann = FALSE)
axis(4, -6:5)


plot(x, y, col="red", xlim=c(0,7), ylim=c(10,22),
     main = "Spline, smoothness = 2")
grid()

lines(xs,evalK2(xs), col="cyan")
par(new = TRUE)
plot(derK2, from = 1, to = 6, col = "magenta", xlim = c(0,7), ylim = c(-6,5),
     xaxt = 'n',yaxt = 'n', ann = FALSE)
axis(4, -6:5)

plot(derK1, from = 1.5, to = 2.5)
plot(derK2, from = 1.5, to = 2.5)

## EXAMPLE 2
par(mfrow = c(1,1))
X <- seq(0, 50, 5)
Y <- seq(0, 40, 5)

X_ <- seq(0, 50, 0.5)
Y_ <- seq(0, 40, 0.5)

persp3D(X_, Y_, sps_interpolate(X, Y, akima, X_, Y_,
        grid = TRUE, shape = 'monotonicity'))



