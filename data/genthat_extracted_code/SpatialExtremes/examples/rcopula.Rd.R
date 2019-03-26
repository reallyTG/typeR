library(SpatialExtremes)


### Name: rcopula
### Title: Simulation from copula based models with unit Frechet margins
### Aliases: rcopula
### Keywords: distribution

### ** Examples

n.site <- 25
n.obs <- 50

coord <- matrix(runif(2 * n.site, 0, 10), ncol = 2)

data1 <- rcopula(n.obs, coord, "student", "whitmat", range = 3, DoF = 3)

x <- y <- seq(0, 10, length = 100)
data2 <- rcopula(1, cbind(x, y), "gaussian", "whitmat", range = 3, grid
= TRUE)
image(x, y, log(data2), col = rainbow(64))



