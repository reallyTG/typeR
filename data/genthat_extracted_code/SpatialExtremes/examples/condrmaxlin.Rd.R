library(SpatialExtremes)


### Name: condrmaxlin
### Title: Conditional simulation of max-linear random fields
### Aliases: condrmaxlin
### Keywords: distribution

### ** Examples

## One dimensional conditional simulations
n.cond.site <- 10
cond.coord <- runif(n.cond.site, -10, 10)
data <- rmaxlin(1, cond.coord, var = 3, p = 10000)

x <- seq(-10, 10, length = 250)
cond.sim <- condrmaxlin(5, x, cond.coord, data, var = 3)

matplot(x, t(log(cond.sim)), type = "l", lty = 1, pch = 1)
points(cond.coord, log(data))

## Two dimensional conditional simulation
cond.coord <- matrix(runif(2 * n.cond.site, -10, 10), ncol = 2)
data <- rmaxstab(1, cond.coord, "gauss", cov11 = 4, cov12 = 0, cov22 = 4)

x <- y <- seq(-10, 10, length = 75)
cond.sim <- condrmaxlin(4, cbind(x, y), cond.coord, data, cov11 = 4,
cov12 = 0, cov22 = 4, grid = TRUE, p = 2000)
## Note p is set to 2000 for CPU reasons but is likely to be too small

op <- par(mfrow = c(2, 2), mar = rep(1, 4))
for (i in 1:4){
image(x, y, log(cond.sim[,,i]), col = heat.colors(64), xaxt = "n", yaxt
= "n", bty = "n")
contour(x, y, log(cond.sim[,,i]), add = TRUE)
text(cond.coord[,1], cond.coord[,2], round(log(data), 2), col = 3)
}
par(op)



