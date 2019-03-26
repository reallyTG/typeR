library(ade4)


### Name: irishdata
### Title: Geary's Irish Data
### Aliases: irishdata
### Keywords: datasets

### ** Examples

data(irishdata)

if(adegraphicsLoaded()) {

  if(requireNamespace("sp", quietly = TRUE)){
  g1 <- s.label(irishdata$xy.utm, Sp = irishdata$Spatial, pSp.col = "white", plot = FALSE)
  
  g21 <- s.label(irishdata$xy.utm, Sp = irishdata$Spatial, pSp.col = "white", plab.cex = 0, 
    ppoints.cex = 0, plot = FALSE)
  g22 <- s.label(irishdata$xy.utm, Sp = irishdata$Spatial.contour, pSp.col = "transparent", 
    plab.cex = 0, ppoints.cex = 0, pSp.lwd = 3, plot = FALSE)
  g2 <- superpose(g21, g22)   

  g3 <- s.corcircle(dudi.pca(irishdata$tab, scan = FALSE)$co, plot = FALSE)
  
  score <- dudi.pca(irishdata$tab, scannf = FALSE, nf = 1)$li$Axis1
  names(score) <- row.names(irishdata$Spatial)
  
  obj <- sp::SpatialPolygonsDataFrame(Sr = irishdata$Spatial, data = as.data.frame(score))
  g4 <- s.Spatial(obj, plot = FALSE)
  
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  }
  
} else {
  par(mfrow = c(2, 2))
  area.plot(irishdata$area, lab = irishdata$county.names, clab = 0.75)
  area.plot(irishdata$area)
  apply(irishdata$contour, 1, function(x) segments(x[1], x[2], x[3], x[4], lwd = 3))
  s.corcircle(dudi.pca(irishdata$tab, scannf = FALSE)$co)
  score <- dudi.pca(irishdata$tab, scannf = FALSE, nf = 1)$li$Axis1
  names(score) <- row.names(irishdata$tab)
  area.plot(irishdata$area, score)
  par(mfrow = c(1, 1))
}


