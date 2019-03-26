library(adehabitatMA)


### Name: morphology
### Title: Morphology: Erosion or Dilatation of Features on a Raster Map
### Aliases: morphology
### Keywords: spatial

### ** Examples


data(meuse.grid)
a <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
                            data = meuse.grid)


## dilatation
toto1 <- morphology(a, operation = "dilate", nt = 1)
toto2 <- morphology(a, operation = "dilate", nt = 2)
toto3 <- morphology(a, operation = "dilate", nt = 3)
toto5 <- morphology(a, operation = "dilate", nt = 5)
colo <- grey((1:5)/6)
image(toto5, col = colo[1])
image(toto3, add = TRUE, col = colo[2])
image(toto2, add = TRUE, col = colo[3])
image(toto1, add = TRUE, col = colo[4])
image(a, add = TRUE)

## erosion
colo <- grey((1:12)/13)
image(a, col = "black")
for (i in 1:12) {
  toto <- morphology(a, operation = "erode", nt = i)
  image(toto, add = TRUE, col = colo[i])
}





