library(ade4)


### Name: s.value
### Title: Representation of a value in a graph
### Aliases: s.value
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  xy <- cbind.data.frame(x = runif(500), y = runif(500))
  z <- rnorm(500)
  s.value(xy, z)
  
  s.value(xy, z, method = "greylevel")
  
  data(rpjdl)
  fau.coa <- dudi.coa(rpjdl$fau, scan = FALSE, nf = 3)
  s.value(fau.coa$li, fau.coa$li[,3], csi = 0.75, cleg = 0.75)
  
  data(irishdata)
  par(mfrow = c(3, 4))
  irq0 <- data.frame(scale(irishdata$tab, scale = TRUE))
  for (i in 1:12) {
    z <- irq0[, i]
    nam <- names(irq0)[i]
    s.value(irishdata$xy, z, area = irishdata$area, csi = 3,
      csub = 2, sub = nam, cleg = 1.5, cgrid = 0, inc = FALSE,
      xlim = c(16, 205), ylim = c(-50, 268), adda = FALSE, grid = FALSE)
  }
}


