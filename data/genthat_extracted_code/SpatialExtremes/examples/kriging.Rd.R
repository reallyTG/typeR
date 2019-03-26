library(SpatialExtremes)


### Name: kriging
### Title: Simple kriging interpolation
### Aliases: kriging
### Keywords: spatial htest

### ** Examples

## Kriging from a single realisation
n.site <- 50
n.pred <- 512

x.obs <- runif(n.site, -100, 100)
x.pred <- seq(-100, 100, length = n.pred)

data <- rgp(1, x.obs, "whitmat", sill = 1, range = 10, smooth = 0.75)

krig <- kriging(data, x.obs, x.pred, "whitmat", sill = 1, range = 10,
smooth = 0.75)

plot(krig$coord, krig$krig.est, type = "l", xlab = "x", ylab =
expression(hat(Y)(x)))
points(x.obs, data, col = 2, pch = 21, bg = 2)

## Kriging from several realisations
n.real <- 3
data <- rgp(n.real, x.obs, "whitmat", sill = 1, range = 10, smooth = 0.75)

krig <- kriging(data, x.obs, x.pred, "whitmat", sill = 1, range = 10,
smooth = 0.75)

matplot(krig$coord, t(krig$krig.est), type = "l", xlab = "x", ylab =
expression(hat(Y)(x)), lty = 1)
matpoints(x.obs, t(data), pch = 21, col = 1:n.real, bg = 1:n.real)
title("Three kriging predictors in one shot")

## Two dimensional kriging on a grid
x.obs <- matrix(runif(2 * n.site, -100, 100), ncol = 2)
x <- y <- seq(-100, 100, length = 100)
x.pred <- cbind(x, y)

data <- rgp(1, x.obs, "whitmat", sill = 1, range = 10, smooth = 0.75)

krig <- kriging(data, x.obs, x.pred, "whitmat", sill = 1, range = 10,
smooth = 0.75, grid = TRUE)

z.lim <- range(c(data, krig$krig.est))
breaks <- seq(z.lim[1], z.lim[2], length = 65)
col <- heat.colors(64)
idx <- as.numeric(cut(data, breaks))

image(x, y, krig$krig.est, col = col, breaks = breaks)
points(x.obs, bg = col[idx], pch = 21)
## Note how the background colors of the above points matches the ones
## returned by the image function



