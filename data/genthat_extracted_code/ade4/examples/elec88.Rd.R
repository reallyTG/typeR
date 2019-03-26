library(ade4)


### Name: elec88
### Title: Electoral Data
### Aliases: elec88
### Keywords: datasets

### ** Examples

data(elec88)
apply(elec88$tab, 2, mean)
summary(elec88$res)
pca1 <- dudi.pca(elec88$tab, scale = FALSE, scannf = FALSE)

if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    data1 <- as.data.frame(as.numeric(rownames(elec88$tab) == "D25"))
    rownames(data1) <- row.names(elec88$Spatial)
    obj1 <- sp::SpatialPolygonsDataFrame(Sr = elec88$Spatial, data = data1)
    g1 <- s.Spatial(obj1, psub.text = "", plot = FALSE)
    g2 <- s.Spatial(obj1, psub.text = "", nb = elec88$nb, pnb.node.cex = 0, plot = FALSE)

    data3 <- as.data.frame(elec88$xy[, 1] + elec88$xy[, 2])
    rownames(data3) <- row.names(elec88$Spatial)
    obj3 <- sp::SpatialPolygonsDataFrame(Sr = elec88$Spatial, data = data3)
    g3 <- s.Spatial(obj3, psub.text = "", plot = FALSE)
    
    data4 <- as.data.frame(pca1$li[, 1])
    rownames(data4) <- row.names(elec88$Spatial)
    obj4 <- sp::SpatialPolygonsDataFrame(Sr = elec88$Spatial, data = data4)
    g4 <- s.Spatial(obj4, psub.text = "F1 PCA", plot = FALSE)
    
    G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  }
  
} else {
  par(mfrow = c(2, 2))
  plot(elec88$area[, 2:3], type = "n", asp = 1)
  lpoly <- split(elec88$area[, 2:3], elec88$area[, 1])
  lapply(lpoly, function(x) {points(x, type = "l"); invisible()})
  polygon(elec88$area[elec88$area$V1 == "D25", 2:3], col = 1)
  area.plot(elec88$area, graph = elec88$neig, lwdg = 1)
  polygon(elec88$area[elec88$area$V1 == "D25", 2:3], col = 1)
  area.plot(elec88$area, val = elec88$xy[, 1] + elec88$xy[, 2])
  area.plot(elec88$area, val = pca1$li[, 1], sub = "F1 PCA", 
    csub = 2, cleg = 1.5)
  par(mfrow = c(1, 1))
}


