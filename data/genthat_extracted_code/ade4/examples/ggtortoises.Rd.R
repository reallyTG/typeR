library(ade4)


### Name: ggtortoises
### Title: Microsatellites of Galapagos tortoises populations
### Aliases: ggtortoises
### Keywords: datasets

### ** Examples

if(requireNamespace("pixmap", quietly=TRUE)) {
  data(ggtortoises)
  
  if(adegraphicsLoaded()) {
    if(requireNamespace("sp", quietly = TRUE)) {
      g1 <- s.logo(ggtortoises$pop, ggtortoises$ico[as.character(ggtortoises$pop$carap)], 
        Sp = ggtortoises$Spatial, pbackground.col = "lightblue", pSp.col = "white", 
        pgrid.draw = FALSE, ppoints.cex = 0.5)
      g1 <- s.label(ggtortoises$misc, pgrid.draw = FALSE, porigin.include = FALSE, 
        paxes.draw = FALSE, add = TRUE)
    }

  } else {    
  	a1 <- ggtortoises$area
  	area.plot(a1)
  	rect(min(a1$x), min(a1$y), max(a1$x), max(a1$y), col = "lightblue")
  	invisible(lapply(split(a1, a1$id), function(x) polygon(x[, -1], col = "white")))
  	s.label(ggtortoises$misc, grid = FALSE, include.ori = FALSE, addaxes = FALSE, add.p = TRUE)
  	listico <- ggtortoises$ico[as.character(ggtortoises$pop$carap)]
  	s.logo(ggtortoises$pop, listico, add.p = TRUE)
  }
}


