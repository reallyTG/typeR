library(adegraphics)


### Name: adeg.panel.nb
### Title: Panel functions for adding graphs.
### Aliases: adeg.panel.nb adeg.panel.edges
### Keywords: aplot

### ** Examples

if(require(lattice, quietly = TRUE) &
  require(spdep, quietly = TRUE)) {

  data(elec88, package = "ade4")
  coords <- elec88$xy
  xyplot(coords[, 2] ~ coords[, 1],
    panel = function(...){adeg.panel.nb(elec88$nb, coords, col.edge = c("blue", "red"))})
}

if(require(lattice, quietly = TRUE)) {
  edges <- matrix(c(1, 2, 3, 2, 4, 1, 3, 4), byrow = TRUE, ncol = 2)
  coords <- matrix(c(0, 1, 1, 0, 0, -1, -1, 0), byrow = TRUE, ncol = 2)
  xyplot(coords[,2] ~ coords[,1],
    panel = function(...){adeg.panel.edges(edges, coords, lty = 1:4, cex = 5)})
}



