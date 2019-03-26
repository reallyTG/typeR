library(Directional)


### Name: Spherical-spherical regression
### Title: Spherical-Spherical regression
### Aliases: spher.reg
### Keywords: Spherical-Spherical regression Spherical data

### ** Examples

mx <- rnorm(3)
mx <- mx/sqrt( sum(mx^2) )
my <- rnorm(3)
my <- my/sqrt( sum(my^2) )
x <- rvmf(100, mx, 15)
A <- rotation(mx, my)
y <- x %*% t(A)
mod <- spher.reg(y, x)
A
mod$A ## exact match, no noise
y <- x %*% t(A)
y <- y + rvmf(100, colMeans(y), 40)
mod <- spher.reg(y, x)
A
mod$A ## noise added, more relistic example



