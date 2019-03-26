library(SpatialExtremes)


### Name: condrgp
### Title: Conditional simulation of Gaussian random fields
### Aliases: condrgp
### Keywords: distribution spatial

### ** Examples

## Several conditional simulations
n.site <- 50
n.sim <- 512

x.obs <- runif(n.site, -100, 100)
x.sim <- seq(-100, 100, length = n.sim)

data <- rgp(1, x.obs, "whitmat", sill = 1, range = 10, smooth = 0.75)

sim <- condrgp(5, x.sim, x.obs, data, "whitmat", sill = 1, range =
10, smooth = 0.75)

matplot(x.sim, t(sim$cond.sim),  type = "l", lty = 1, xlab = "x", ylab =
expression(Y[cond](x)))
points(x.obs, data, pch = 21, bg = 1)
title("Five conditional simulations")

## Comparison between one conditional simulations and the kriging
## predictor on a grid
x.obs <- matrix(runif(2 * n.site, -100, 100), ncol = 2)
x <- y <- seq(-100, 100, length = 100)
x.sim <- cbind(x, y)

data <- rgp(1, x.obs, "whitmat", sill = 1, range = 50, smooth = 0.75)

krig <- kriging(data, x.obs, x.sim, "whitmat", sill = 1, range = 50,
smooth = 0.75, grid = TRUE)
sim <- condrgp(1, x.sim, x.obs, data, "whitmat", sill = 1, range = 50,
smooth = 0.75, grid = TRUE)

z.lim <- range(c(sim$cond.sim, data, krig$krig.est))
breaks <- seq(z.lim[1], z.lim[2], length = 65)
col <- heat.colors(64)
idx <- as.numeric(cut(data, breaks))

op <- par(mfrow = c(1,2))
image(x, y, krig$krig.est, col = col, breaks = breaks)
points(x.obs, bg = col[idx], pch = 21)
title("Kriging predictor")
image(x, y, sim$cond.sim, col = col, breaks = breaks)
points(x.obs, bg = col[idx], pch = 21)
title("Conditional simulation")
## Note how the background colors of the above points matches the ones
## returned by the image function
par(op)



