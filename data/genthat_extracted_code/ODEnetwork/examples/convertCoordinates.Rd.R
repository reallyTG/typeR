library(ODEnetwork)


### Name: convertCoordinates
### Title: Converts coordinates between cartesian and polar
### Aliases: convertCoordinates

### ** Examples

if (interactive()) {
  coordsK <- rbind(c(3, 0), c(1, 3), c(0, 2), c(-3, 1), c(-1, 0), c(-1, -3), c(0, -2), c(2, -3))
  coordsP <- convertCoordinates(coordsK, "polar")
}



