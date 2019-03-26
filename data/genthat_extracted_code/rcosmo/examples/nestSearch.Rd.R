library(rcosmo)


### Name: nestSearch
### Title: Finds the closest pixel center to a point
### Aliases: nestSearch

### ** Examples


## Find the closest HEALPix pixel center at resolution j=2 for
## the point (0.6,0.8,0)

point <- c(0.6,0.8,0)
j <- 2
cpoint <- nestSearch(point, nside = 2^j)

## Plot the closest pixel center in blue and the point (0.6,0.8,0) in red
displayPixels(j, j, plot.j=j, spix=c(cpoint$pix),
              size=5, incl.labels =FALSE)
rgl::plot3d(point[1], point[2], point[3],
            col="red", size = 5, add = TRUE)


## Repeat the above for 4 points in a data.frame
points <- data.frame(x = c(1,0,0,0.6),
                     y = c(0,1,0,0.8),
                     z = c(0,0,1,0))
points
j <- 2
cpoints <- nestSearch(points, nside = 2^j)

## Plot the closest pixel center in blue and the point (0.6,0.8,0) in red
displayPixels(j, j, plot.j=j, spix=c(cpoints$pix),
              size=5, incl.labels =FALSE)
rgl::plot3d(points[,1], points[,2], points[,3],
            col="red", size = 5, add = TRUE)




