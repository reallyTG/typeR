library(rcosmo)


### Name: neighbours
### Title: Return neighbouring pixels
### Aliases: neighbours

### ** Examples

## Return the neighbouring pixels for base pixel 1
neighbours(1, 0)

## Plot the neighbouring pixels for base pixel 1
demoNeighbours <- function(p,j) {
  neighbours(p, j)
  displayPixels(boundary.j = j, j = j, plot.j = j+3,
                spix = neighbours(p, j),
                boundary.col = "gray",
                boundary.lwd = 1,
                incl.labels = neighbours(p, j),
                col = "blue",
                size = 3)
  rcosmo::displayPixelBoundaries(nside = 1, col = "blue", lwd = 3)
}

demoNeighbours(1,2)
demoNeighbours(1,0)




