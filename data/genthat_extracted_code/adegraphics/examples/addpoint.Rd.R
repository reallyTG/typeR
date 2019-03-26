library(adegraphics)


### Name: addpoint
### Title: Adds points on graphics.
### Aliases: addpoint addpoint-methods addpoint,ADEg-method
###   addpoint,ADEgS-method
### Keywords: aplot

### ** Examples

data(deug, package = "ade4")
deug$cent[1]
g1 <- s1d.density(deug$tab[, 1], plot = FALSE)
addpoint(g1, xcoord = deug$cent[1], ycoord = 0, ppoints = list(col = "black",
  pch = "*", cex = 3))



