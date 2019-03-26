library(ade4)


### Name: sco.distri
### Title: Representation by mean- standard deviation of a set of weight
###   distributions on a numeric score
### Aliases: sco.distri
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  w <- seq(-1, 1, le = 200)
  distri <- data.frame(lapply(1:50, 
    function(x) sample((200:1)) * ((w >= (- x / 50)) & (w <= x / 50))))
  names(distri) <- paste("w", 1:50, sep = "")
  par(mfrow = c(1, 2))
  sco.distri(w, distri, csi = 1.5)
  sco.distri(w, distri, y.rank = FALSE, csi = 1.5)
  par(mfrow = c(1, 1))
  
  data(rpjdl)
  coa2 <- dudi.coa(rpjdl$fau, FALSE)
  sco.distri(coa2$li[, 1], rpjdl$fau, lab = rpjdl$frlab, clab = 0.8)
  
  data(doubs)
  par(mfrow = c(2, 2))
  poi.coa <- dudi.coa(doubs$fish, scann = FALSE)
  sco.distri(poi.coa$l1[, 1], doubs$fish)
  poi.nsc <- dudi.nsc(doubs$fish, scann = FALSE)
  sco.distri(poi.nsc$l1[, 1], doubs$fish)
  s.label(poi.coa$l1)
  s.label(poi.nsc$l1)
  
  data(rpjdl)
  fau.coa <- dudi.coa(rpjdl$fau, scann = FALSE)
  sco.distri(fau.coa$l1[,1], rpjdl$fau)
  fau.nsc <- dudi.nsc(rpjdl$fau, scann = FALSE)
  sco.distri(fau.nsc$l1[,1], rpjdl$fau)
  s.label(fau.coa$l1)
  s.label(fau.nsc$l1)
  
  par(mfrow = c(1, 1))
}



