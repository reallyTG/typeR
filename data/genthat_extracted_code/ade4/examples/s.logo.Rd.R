library(ade4)


### Name: s.logo
### Title: Representation of an object in a graph by a picture
### Aliases: s.logo scatterutil.logo
### Keywords: multivariate hplot

### ** Examples

if(requireNamespace("pixmap", quietly = TRUE) & requireNamespace("sp", quietly = TRUE)) {
  if(!adegraphicsLoaded()) {
  	data(ggtortoises)
  	a1 <- ggtortoises$area
  	area.plot(a1)
  	rect(min(a1$x), min(a1$y), max(a1$x), max(a1$y), col = "lightblue")
  	invisible(lapply(split(a1, a1$id), function(x) polygon(x[, -1],col = "white")))
  	s.label(ggtortoises$misc, grid = FALSE, include.ori = FALSE, addaxes = FALSE, add.p = TRUE)
  	listico <- ggtortoises$ico[as.character(ggtortoises$pop$carap)]
  	s.logo(ggtortoises$pop, listico, add.p = TRUE)
  	
  } else {
  	data(capitales, package = "ade4")
  	# 'capitales' data doesn't work with ade4 anymore
    g3 <- s.logo(capitales$xy[sort(rownames(capitales$xy)), ], capitales$logo, 
      Sp = capitales$Spatial, pbackground.col = "lightblue", pSp.col = "white", 
      pgrid.draw = FALSE)
  }
}


