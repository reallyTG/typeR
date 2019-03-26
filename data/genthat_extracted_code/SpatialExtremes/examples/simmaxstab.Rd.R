library(SpatialExtremes)


### Name: rmaxstab
### Title: Simulation of Max-Stable Random Fields
### Aliases: rmaxstab
### Keywords: distribution

### ** Examples

## 1. Smith's model
set.seed(8)
x <- y <- seq(0, 10, length = 100)
coord <- cbind(x, y)
data <- rmaxstab(1, coord, "gauss", cov11 = 9/8, cov12 = 0, cov22 = 9/8,
  grid = TRUE)
##We change to unit Gumbel margins for visibility
filled.contour(x, y, log(data), color.palette = terrain.colors)

## 2. Schlather's model
data <- rmaxstab(1, coord, cov.mod = "powexp", nugget = 0, range = 3,
smooth = 1, grid = TRUE)
filled.contour(x, y, log(data), color.palette = terrain.colors)

## 3. Brown--Resnick's model **** Only available for non gridded points currently ****
data <- rmaxstab(1, x, cov.mod = "brown", range = 3, smooth = 0.5)
plot(x, log(data), type = "l")

## 4. Extremal-t model *** Very time consuming for 2d grids ***
data <- rmaxstab(1, x, "twhitmat", DoF = 4, nugget = 0, range = 3,
smooth = 0.7)
plot(x, log(data), type = "l")



