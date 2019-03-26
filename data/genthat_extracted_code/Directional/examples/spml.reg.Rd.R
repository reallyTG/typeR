library(Directional)


### Name: Circular or angular regression
### Title: Circular or angular regression
### Aliases: spml.reg
### Keywords: Circular regression Projected normal

### ** Examples

x <- rnorm(100)
z <- cbind(3 + 2 * x, 1 -3 * x)
y <- cbind( rnorm(100,z[ ,1], 1), rnorm(100, z[ ,2], 1) )
y <- y / sqrt( rowSums(y^2) )
y <- ( atan( y[, 2] / y[, 1] ) + pi * I(y[, 1] < 0) ) %% (2 * pi)
spml.reg(y, x, rads = TRUE)



