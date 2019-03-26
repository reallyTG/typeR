library(ade4)


### Name: avijons
### Title: Bird species distribution
### Aliases: avijons
### Keywords: datasets

### ** Examples

data(avijons)
w1 <- dudi.coa(avijons$fau, scannf = FALSE)$li
area.plot(avijons$area, center = avijons$xy, val = w1[, 1], clab = 0.75, 
  sub = "CA Axis 1", csub = 3)
  
## Not run: 
##D data(avijons)
##D if(!adegraphicsLoaded()) {
##D   if(requireNamespace("pixmap", quietly = TRUE)) {
##D     pnm.eau <- pixmap::read.pnm(system.file("pictures/avijonseau.pnm", package = "ade4"))
##D     pnm.rou <- pixmap::read.pnm(system.file("pictures/avijonsrou.pnm", package = "ade4"))
##D     pnm.veg <- pixmap::read.pnm(system.file("pictures/avijonsveg.pnm", package = "ade4"))
##D     pnm.vil <- pixmap::read.pnm(system.file("pictures/avijonsvil.pnm", package = "ade4"))
##D     jons.coa <- dudi.coa(avijons$fau, scan = FALSE, nf = 4)
##D     
##D     par(mfcol = c(3, 2))
##D     s.value(avijons$xy, jons.coa$li[, 1], pixmap = pnm.rou, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+ROADS", csub = 3)
##D     s.value(avijons$xy, jons.coa$li[, 1], pixmap = pnm.veg, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+TREES", csub = 3)
##D     s.value(avijons$xy, jons.coa$li[, 1], pixmap = pnm.eau, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+WATER", csub = 3)
##D     s.value(avijons$xy, jons.coa$li[, 2], pixmap = pnm.rou, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+ROADS", csub = 3)
##D     s.value(avijons$xy, jons.coa$li[, 2], pixmap = pnm.veg, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+TREES", csub = 3)
##D     s.value(avijons$xy, jons.coa$li[, 2], pixmap = pnm.eau, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+WATER", csub = 3)
##D     par(mfrow = c(1, 1))
##D   }
##D 
##D   if(requireNamespace("spdep", quietly = TRUE) & 
##D     requireNamespace("pixmap", quietly = TRUE)) {
##D     
##D     link1 <- area2link(avijons$area)
##D     lw1 <- apply(link1, 1, function(x) x[x > 0])
##D     neig1 <- neig(mat01 = 1*(link1 > 0))
##D     nb1 <- neig2nb(neig1)
##D     listw1 <- spdep::nb2listw(nb1,lw1)
##D     jons.ms <- multispati(jons.coa, listw1, scan = FALSE, nfp = 3, nfn = 2)
##D     summary(jons.ms)
##D     par(mfrow = c(2, 2))
##D     barplot(jons.coa$eig)
##D     barplot(jons.ms$eig)
##D     s.corcircle(jons.ms$as)
##D     plot(jons.coa$li[, 1], jons.ms$li[, 1])
##D     par(mfrow = c(1, 1))
##D 
##D     par(mfcol = c(3, 2))
##D     s.value(avijons$xy, jons.ms$li[, 1], pixmap = pnm.rou, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+ROADS", csub = 3)
##D     s.value(avijons$xy, jons.ms$li[, 1], pixmap = pnm.veg, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+TREES", csub = 3)
##D     s.value(avijons$xy, jons.ms$li[, 1], pixmap = pnm.eau, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F1+WATER", csub = 3)
##D     s.value(avijons$xy, jons.ms$li[, 2], pixmap = pnm.rou, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+ROADS", csub = 3)
##D     s.value(avijons$xy, jons.ms$li[, 2], pixmap = pnm.veg, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+TREES", csub = 3)
##D     s.value(avijons$xy, jons.ms$li[, 2], pixmap = pnm.eau, inclu = FALSE,
##D       grid = FALSE, addax = FALSE, cleg = 0, sub = "F2+WATER", csub = 3)
##D     par(mfrow = c(1, 1))
##D }}
## End(Not run)


