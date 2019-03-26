library(ade4)


### Name: s.distri
### Title: Plot of a frequency distribution
### Aliases: s.distri
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  xy <- cbind.data.frame(x = runif(200, -1, 1), y = runif(200, -1, 1))
  distri <- data.frame(w1 = rpois(200, xy$x * (xy$x > 0)))
  s.value(xy, distri$w1, cpoi = 1)
  s.distri(xy, distri, add.p = TRUE)
  
  w1 <- as.numeric((xy$x> 0) & (xy$y > 0))
  w2 <- ((xy$x > 0) & (xy$y < 0)) * (1 - xy$y) * xy$x
  w3 <- ((xy$x < 0) & (xy$y > 0)) * (1 - xy$x) * xy$y
  w4 <- ((xy$x < 0) & (xy$y < 0)) * xy$y * xy$x
  
  distri <- data.frame(a = w1 / sum(w1), b = w2 / sum(w2), 
    c = w3 / sum(w3), d = w4 / sum(w4))
  s.value(xy, unlist(apply(distri, 1, sum)), cleg = 0, csi = 0.75)
  s.distri(xy, distri, clab = 2, add.p = TRUE)
  
  data(rpjdl)
  xy <- dudi.coa(rpjdl$fau, scan = FALSE)$li
  par(mfrow = c(3, 4))
  for (i in c(1, 5, 8, 20, 21, 23, 26, 33, 36, 44, 47, 49)) {
    s.distri(xy, rpjdl$fau[, i], cell = 1.5, sub = rpjdl$frlab[i], 
      csub = 2, cgrid = 1.5)}
  par(mfrow = c(1, 1))
}


