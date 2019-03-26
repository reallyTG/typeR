library(pracma)


### Name: cart2sph
### Title: Coordinate Transformations
### Aliases: cart2sph sph2cart cart2pol pol2cart
### Keywords: math

### ** Examples

x <- 0.5*cos(pi/6); y <- 0.5*sin(pi/6); z <- sqrt(1 - x^2 - y^2)
(s <-cart2sph(c(x, y, z)))      # 0.5235988 1.0471976 1.0000000
sph2cart(s)                     # 0.4330127 0.2500000 0.8660254

cart2pol(c(1,1))                # 0.7853982 1.4142136
cart2pol(c(1,1,0))              # 0.7853982 1.4142136 0.0000000
pol2cart(c(pi/2, 1))            # 6.123234e-17 1.000000e+00
pol2cart(c(pi/4, 1, 1))         # 0.7071068 0.7071068 1.0000000

##  Transform spherical to cylindrical coordinates and vice versa
sph2cyl <- function(th.ph.r) cart2pol(sph2cart(th.ph.r))
cyl2sph <- function(phi.r.z) cart2sph(pol2cart(phi.r.z))



