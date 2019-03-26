library(ade4)


### Name: mafragh
### Title: Phyto-Ecological Survey
### Aliases: mafragh
### Keywords: datasets

### ** Examples

data(mafragh)
coa1 <- dudi.coa(mafragh$flo, scan = FALSE)
pca1 <- dudi.pca(mafragh$xy, scan = FALSE)
if(adegraphicsLoaded()) {
  g1 <- s.label(mafragh$xy, nb = mafragh$nb, psub.text = "Samples & Neighbourhood graph", 
    plot = FALSE)
  g2 <- s.value(mafragh$xy, coa1$li[, 1], psub.text = "Axis 1 - COA", plot = FALSE)
  g3 <- s.value(mafragh$xy, pca1$li[, 1], psub.text = "Axis 1 - PCA", plot = FALSE)
  g4 <- s.class(pca1$li, mafragh$partition, psub.text = "Plane 1-2 - PCA", plot = FALSE)
  g5 <- s.class(coa1$li, mafragh$partition, psub.text = "Plane 1-2 - COA", plot = FALSE)
  g6 <- s.class(mafragh$xy, mafragh$partition, chullSize = 1, ellipseSize = 0, starSize = 0, 
    ppoints.cex = 0, plot = FALSE)
  G <- ADEgS(c(g1, g2, g3, g4, g5, g6), layout = c(3, 2))

} else {
  par(mfrow = c(3, 2))
  s.label(mafragh$xy, inc = FALSE, neig = mafragh$neig, sub = "Samples & Neighbourhood graph")
  s.value(mafragh$xy, coa1$li[, 1], sub = "Axis 1 - COA")
  s.value(mafragh$xy, pca1$li[, 1], sub = "Axis 1 - PCA")
  s.class(pca1$li, mafragh$partition, sub = "Plane 1-2 - PCA")
  s.class(coa1$li, mafragh$partition, sub = "Plane 1-2 - COA")
  s.chull(mafragh$xy, mafragh$partition, optchull = 1)
  par(mfrow = c(1, 1))
}

## Not run: 
##D link1 <- area2link(mafragh$area)
##D neig1 <- neig(mat01 = 1*(link1 > 0))
##D nb1 <- neig2nb(neig1)
##D 
##D if(adegraphicsLoaded()) {
##D   if(requireNamespace("sp", quietly = TRUE)) {
##D     g7 <- s.label(mafragh$xy, Sp = mafragh$Spatial, pSp.col = "white", plot = FALSE)
##D     g8 <- s.label(mafragh$xy, Sp = mafragh$Spatial, pSp.col = "white", nb = nb1, plab.cex = 0, 
##D       pnb.node.cex = 0, ppoints.cex = 0, plot = FALSE)
##D     G <- ADEgS(c(g7, g8), layout = c(2, 1))
##D   }
##D 
##D } else {
##D   par(mfrow = c(2, 1))
##D   area.plot(mafragh$area, center = mafragh$xy, clab = 0.75)
##D   area.plot(mafragh$area, center = mafragh$xy, graph = neig1)
##D   par(mfrow = c(1, 1))
##D }
##D 
##D if(requireNamespace("spdep", quietly = TRUE)) {
##D   lw1 <- apply(link1, 1, function(x) x[x > 0])
##D   listw1 <- spdep::nb2listw(nb1, lw1)
##D   coa1 <- dudi.coa(mafragh$flo, scan = FALSE, nf = 4)
##D   ms1 <- multispati(coa1, listw1, scan = FALSE, nfp = 2, nfn = 0)
##D   summary(ms1)
##D   
##D   if(adegraphicsLoaded()) {
##D     if(requireNamespace("lattice", quietly = TRUE)) {
##D       g9 <- s1d.barchart(coa1$eig, p1d.hori = FALSE, plot = FALSE)
##D       g10 <- s1d.barchart(ms1$eig, p1d.hori = FALSE, plot = FALSE)
##D       g11 <- s.corcircle(ms1$as, plot = FALSE)
##D       g12 <- lattice::xyplot(ms1$li[, 1] ~ coa1$li[, 1])
##D       G <- ADEgS(list(g9, g10, g11, g12), layout = c(2, 2))
##D     }
##D     
##D   } else {    
##D     par(mfrow = c(2, 2))
##D     barplot(coa1$eig)
##D     barplot(ms1$eig)
##D     s.corcircle(ms1$as)
##D     plot(coa1$li[, 1], ms1$li[, 1])
##D     par(mfrow = c(1, 1))
##D   }
##D }
## End(Not run)


