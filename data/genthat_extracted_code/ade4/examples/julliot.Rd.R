library(ade4)


### Name: julliot
### Title: Seed dispersal
### Aliases: julliot
### Keywords: datasets

### ** Examples

data(julliot)

## Not run: 
##D if(adegraphicsLoaded()) {
##D   if(requireNamespace("sp", quietly = TRUE)) {
##D     obj1 <- sp::SpatialPolygonsDataFrame(Sr = julliot$Spatial, data = log(julliot$tab + 1))
##D     g1 <- s.Spatial(obj1)
##D     g2 <- s.value(julliot$xy, scalewt(log(julliot$tab + 1)), Sp = julliot$Spatial, 
##D       pSp.col = "white", pgrid.draw = FALSE)
##D   }
##D } else {
##D   if(requireNamespace("splancs", quietly = TRUE)) {
##D     par(mfrow = c(3, 3))
##D     for(k in 1:7)
##D       area.plot(julliot$area, val = log(julliot$tab[, k] + 1),
##D         sub = names(julliot$tab)[k], csub = 2.5)
##D     par(mfrow = c(1, 1))
##D     
##D     par(mfrow = c(3, 3))
##D     for(k in 1:7) {
##D       area.plot(julliot$area)
##D       s.value(julliot$xy, scalewt(log(julliot$tab[, k] + 1)),
##D         sub = names(julliot$tab)[k], csub = 2.5, add.p = TRUE)
##D     }
##D     par(mfrow = c(1, 1))
##D   }
##D }
## End(Not run)


if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    g3 <- s.image(julliot$xy, log(julliot$tab + 1), span = 0.25)
  }
  g4 <- s.value(julliot$xy, log(julliot$tab + 1))
  
} else {
  if(requireNamespace("splancs", quietly = TRUE)) {
    par(mfrow = c(3, 3))
    for(k in 1:7)
      s.image(julliot$xy, log(julliot$tab[, k] + 1), kgrid = 3, span = 0.25,
        sub = names(julliot$tab)[k], csub = 2.5)
    par(mfrow = c(1, 1))
    
    par(mfrow = c(3, 3))
    for(k in 1:7)
      s.value(julliot$xy, log(julliot$tab[, k] + 1),
        sub = names(julliot$tab)[k], csub = 2.5)
    par(mfrow = c(1, 1))    
  }
}
        
## Not run: 
##D if (requireNamespace("spdep", quietly = TRUE)) {
##D   neig0 <- nb2neig(spdep::dnearneigh(as.matrix(julliot$xy), 1, 1.8))
##D   if(adegraphicsLoaded()) {
##D     g5 <- s.label(julliot$xy, nb = spdep::dnearneigh(as.matrix(julliot$xy), 1, 1.8))
##D   
##D   } else {
##D     par(mfrow = c(1, 1))
##D     s.label(julliot$xy, neig = neig0, clab = 0.75, incl = FALSE,
##D      addax = FALSE, grid = FALSE)
##D   }
##D   gearymoran(ade4:::neig.util.LtoG(neig0), log(julliot$tab + 1))
##D   
##D   if (requireNamespace("adephylo", quietly = TRUE)) {
##D     adephylo::orthogram(log(julliot$tab[, 3] + 1), ortho = scores.neig(neig0))
##D   }
##D }
## End(Not run)



