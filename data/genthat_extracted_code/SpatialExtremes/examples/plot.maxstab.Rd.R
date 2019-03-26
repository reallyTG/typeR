library(SpatialExtremes)


### Name: plot.maxstab
### Title: Model checking of a fitted max-stable model
### Aliases: plot.maxstab
### Keywords: hplot

### ** Examples

n.site <- 20
n.obs <- 50
coord <- matrix(runif(2 * n.site, 0, 10), ncol = 2)
colnames(coord) <- c("lon", "lat")
data <- rmaxstab(n.obs, coord, "powexp", nugget = 0, range = 3, smooth =
1)
fitted <- fitmaxstab(log(data), coord, "powexp", y ~ 1, y ~ 1, y ~ 1,
nugget = 0)
plot(fitted)



