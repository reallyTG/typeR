library(metR)


### Name: Derivate
### Title: Derivate a discrete variable using finite differences
### Aliases: Derivate Laplacian Divergence Vorticity

### ** Examples

theta <- seq(0, 360, length.out = 20)*pi/180
theta <- theta[-1]
x <- cos(theta)
dx_analytical <- -sin(theta)
dx_finitediff <- Derivate(x ~ theta, cyclical = TRUE)[[1]]

plot(theta, dx_analytical, type = "l")
points(theta, dx_finitediff, col = "red")

# Curvature (Laplacian)
# Note the different boundary conditions for each dimension
variable <- expand.grid(lon = seq(0, 360, by = 3)[-1],
                        lat = seq(-90, 90, by = 3))
variable$z <- with(variable, cos(lat*pi/180*3) + sin(lon*pi/180*2))
variable <- cbind(
     variable,
     as.data.frame(Derivate(z ~ lon + lat, data = variable,
                          cyclical = c(TRUE, FALSE), order = 2)))
library(ggplot2)
ggplot(variable, aes(lon, lat)) +
    geom_contour(aes(z = z)) +
    geom_contour(aes(z = z.ddlon + z.ddlat), color = "red")

# The same as
ggplot(variable, aes(lon, lat)) +
    geom_contour(aes(z = z)) +
    geom_contour(aes(z = Laplacian(z ~ lon + lat, cyclical = c(TRUE, FALSE))),
                 color = "red")




