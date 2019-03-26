library(ade4)


### Name: dudi.pca
### Title: Principal Component Analysis
### Aliases: dudi.pca
### Keywords: multivariate

### ** Examples

data(deug)
deug.dudi <- dudi.pca(deug$tab, center = deug$cent, scale = FALSE, scan = FALSE)
deug.dudi1 <- dudi.pca(deug$tab, center = TRUE, scale = TRUE, scan = FALSE)

if(adegraphicsLoaded()) {
  g1 <- s.class(deug.dudi$li, deug$result, plot = FALSE)
  g2 <- s.arrow(deug.dudi$c1, lab = names(deug$tab), plot = FALSE)
  g3 <- s.class(deug.dudi1$li, deug$result, plot = FALSE)
  g4 <- s.corcircle(deug.dudi1$co, lab = names(deug$tab), full = FALSE, plot = FALSE)
  G1 <- rbindADEg(cbindADEg(g1, g2, plot = FALSE), cbindADEg(g3, g4, plot = FALSE), plot = TRUE)
  
  G2 <- s1d.hist(deug.dudi$tab, breaks = seq(-45, 35, by = 5), type = "density", xlim = c(-40, 40), 
    right = FALSE, ylim = c(0, 0.1), porigin.lwd = 2)
    
} else {
  par(mfrow = c(2, 2))
  s.class(deug.dudi$li, deug$result, cpoint = 1)
  s.arrow(deug.dudi$c1, lab = names(deug$tab))
  s.class(deug.dudi1$li, deug$result, cpoint = 1)
  s.corcircle(deug.dudi1$co, lab = names(deug$tab), full = FALSE, box = TRUE)
  par(mfrow = c(1, 1))

  # for interpretations
  par(mfrow = c(3, 3))
  par(mar = c(2.1, 2.1, 2.1, 1.1))
  for(i in 1:9) {
    hist(deug.dudi$tab[,i], xlim = c(-40, 40), breaks = seq(-45, 35, by = 5), 
      prob = TRUE, right = FALSE, main = names(deug$tab)[i], xlab = "", ylim = c(0, 0.10))
  abline(v = 0, lwd = 3)
  }
  par(mfrow = c(1, 1))
}



