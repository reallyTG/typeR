library(rcosmo)


### Name: displayPixels
### Title: Display the pixels and grandchildren
### Aliases: displayPixels

### ** Examples


## Example 1

## Plot base pixels 1,2,3 by colouring their grandchildren at resolution
## 5 (by default). No pixel boundaries.
displayPixels(j=0, spix=c(1,2,3))

## Plot base pixels 1,2,3 display and their boundaries (boundary.j=0)
displayPixels(0,0, spix=c(1,2,3))

## Plot base pixels 1,2,3 by colouring their grandchildren at resolution 2
displayPixels(0,0, plot.j = 2, spix=c(1,2,3))

## Example 2

demoNeighbours <- function(p,j) {
  neighbours(p, j)
  displayPixels(boundary.j = j, j = j, plot.j = 5,
                spix = neighbours(p, j),
                boundary.col = "gray",
                boundary.lwd = 1,
                incl.labels = neighbours(p, j),
                col = "blue",
                size = 3)
  rcosmo::displayPixelBoundaries(nside = 1, col = "blue", lwd = 3)
}

demoNeighbours(1,2)




