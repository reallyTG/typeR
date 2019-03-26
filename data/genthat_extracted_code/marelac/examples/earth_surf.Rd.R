library(marelac)


### Name: earth_surf
### Title: Surface of 1 dg by 1 dg Cells of the Earth
### Aliases: earth_surf earth_dist
### Keywords: utilities

### ** Examples


 earth_surf(seq(0, 90, by = 15))

 SURF <- outer(X = Bathymetry$x,
               Y = Bathymetry$y,
               FUN <- function(X, Y) earth_surf(Y, X))

 earth_dist(10, 80, 10, 81)
 earth_dist(20, 80, 20, 81)

 SURF <- outer(X = Bathymetry$x,
               Y = Bathymetry$y,
               FUN <- function(X, Y) earth_surf(Y, X))

 sum(SURF)                                   #is: 510,072,000  km2

# the surface of the Oceans, m2
 sum(SURF*(Bathymetry$z < 0))                  # is: 3.58e14

# the volume of the Oceans, m3
- sum(SURF*Bathymetry$z*(Bathymetry$z < 0))    # is: 1.34e+18

# the surface area at several depths
SurfDepth <- vector()

dseq <- seq(-7500, -250, by = 250)

for (i in 2:length(dseq)) {
  ii <- which (Bathymetry$z > dseq[i-1] & Bathymetry$z <= dseq[i])
  SurfDepth[i-1]<-sum(SURF[ii])
}

plot(dseq[-1], SurfDepth, xlab = "depth, m", log = "y",
     ylab = "m2", main = "Surface at ocean depths")




