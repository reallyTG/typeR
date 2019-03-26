library(rgl)


### Name: persp3d
### Title: Surface plots
### Aliases: persp3d persp3d.default
### Keywords: dynamic graphics

### ** Examples


# (1) The Obligatory Mathematical surface.
#     Rotated sinc function.

x <- seq(-10, 10, length = 30)
y <- x
f <- function(x, y) { r <- sqrt(x^2 + y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)] <- 1
open3d()
bg3d("white")
material3d(col = "black")
persp3d(x, y, z, aspect = c(1, 1, 0.5), col = "lightblue",
        xlab = "X", ylab = "Y", zlab = "Sinc( r )")

# (2) Add to existing persp plot:

xE <- c(-10, 10); xy <- expand.grid(xE, xE)
points3d(xy[, 1], xy[, 2], 6, col = "red")
lines3d(x, y = 10, z = 6 + sin(x), col = "green")

phi <- seq(0, 2*pi, len = 201)
r1 <- 7.725 # radius of 2nd maximum
xr <- r1 * cos(phi)
yr <- r1 * sin(phi)
lines3d(xr, yr, f(xr, yr), col = "pink", lwd = 2)

# (3) Visualizing a simple DEM model

z <- 2 * volcano        # Exaggerate the relief
x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)

open3d()
bg3d("slategray")
material3d(col = "black")
persp3d(x, y, z, col = "green3", aspect = "iso",
      axes = FALSE, box = FALSE)

# (4) A globe

lat <- matrix(seq(90, -90, len = 50)*pi/180, 50, 50, byrow = TRUE)
long <- matrix(seq(-180, 180, len = 50)*pi/180, 50, 50)

r <- 6378.1 # radius of Earth in km
x <- r*cos(lat)*cos(long)
y <- r*cos(lat)*sin(long)
z <- r*sin(lat)

open3d()
persp3d(x, y, z, col = "white", 
       texture = system.file("textures/worldsmall.png", package = "rgl"), 
       specular = "black", axes = FALSE, box = FALSE, xlab = "", ylab = "", zlab = "",
       normal_x = x, normal_y = y, normal_z = z)
if (!rgl.useNULL())
  play3d(spin3d(axis = c(0, 0, 1), rpm = 16), duration = 2.5)

## Not run: 
##D # This looks much better, but is slow because the texture is very big
##D persp3d(x, y, z, col = "white", 
##D        texture = system.file("textures/world.png", package = "rgl"), 
##D        specular = "black", axes = FALSE, box = FALSE, xlab = "", ylab = "", zlab = "",
##D        normal_x = x, normal_y = y, normal_z = z)
## End(Not run)



