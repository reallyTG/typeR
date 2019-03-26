library(SpatialExtremes)


### Name: condrmaxstab
### Title: Conditional simulation of max-stable processes
### Aliases: condrmaxstab
### Keywords: distribution spatial

### ** Examples

n.sim <- 50
n.cond <- 5

range <- 10
smooth <- 1.5

n.site <- 200
coord <- seq(-5, 5, length = n.site)
cond.coord <- seq(-4, 4, length = n.cond)
all.coord <- c(cond.coord, coord)

all.cond.data <- rmaxstab(1, all.coord, "powexp", nugget = 0, range = range,
                      smooth = smooth)
cond.data <- all.cond.data[1:n.cond]

ans <- condrmaxstab(n.sim, coord, cond.coord, cond.data, range = range,
                    smooth = smooth, cov.mod = "powexp")

idx <- order(all.coord)
matplot(coord, t(log(ans$sim)), type = "l", col = "grey", lty = 1,
        xlab = expression(x), ylab = expression(Z(x)))
lines(all.coord[idx], log(all.cond.data)[idx])
points(cond.coord, log(cond.data), pch = 15, col = 2)



