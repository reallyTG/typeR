library(ade4)


### Name: pcaiv
### Title: Principal component analysis with respect to instrumental
###   variables
### Aliases: pcaiv plot.pcaiv print.pcaiv summary.pcaiv
### Keywords: multivariate

### ** Examples

# example for the pcaiv
data(rhone)
pca1 <- dudi.pca(rhone$tab, scan = FALSE, nf = 3)
iv1 <- pcaiv(pca1, rhone$disch, scan = FALSE)
summary(iv1)
plot(iv1)

# example for the caiv
data(rpjdl)
millog <- log(rpjdl$mil + 1)
coa1 <- dudi.coa(rpjdl$fau, scann = FALSE)
caiv1 <- pcaiv(coa1, millog, scan = FALSE)

if(adegraphicsLoaded()) {
  G1 <- plot(caiv1)
  
  # analysis with c1 - as - li -ls
  # projections of inertia axes on PCAIV axes
  G2 <- s.corcircle(caiv1$as)
  
  # Species positions
  g31 <- s.label(caiv1$c1, xax = 2, yax = 1, plab.cex = 0.5, xlim = c(-4, 4), plot = FALSE)
  # Sites positions at the weighted mean of present species
  g32 <- s.label(caiv1$ls, xax = 2, yax = 1, plab.cex = 0, plot = FALSE)
  G3 <- superpose(g31, g32, plot = TRUE)
  
  # Prediction of the positions by regression on environmental variables
  G4 <- s.match(caiv1$ls, caiv1$li, xax = 2, yax = 1, plab.cex = 0.5)
  
  # analysis with fa - l1 - co -cor
  # canonical weights giving unit variance combinations
  G5 <- s.arrow(caiv1$fa)
  
  # sites position by environmental variables combinations
  # position of species by averaging
  g61 <- s.label(caiv1$l1, xax = 2, yax = 1, plab.cex = 0, ppoi.cex = 1.5, plot = FALSE)
  g62 <- s.label(caiv1$co, xax = 2, yax = 1, plot = FALSE)
  G6 <- superpose(g61, g62, plot = TRUE)
  
  G7 <- s.distri(caiv1$l1, rpjdl$fau, xax = 2, yax = 1, ellipseSize = 0, starSize = 0.33)
  
  # coherence between weights and correlations
  g81 <- s.corcircle(caiv1$cor, xax = 2, yax = 1, plot = FALSE)
  g82 <- s.arrow(caiv1$fa, xax = 2, yax = 1, plot = FALSE)
  G8 <- cbindADEg(g81, g82, plot = TRUE)

} else {
  plot(caiv1)
  
  # analysis with c1 - as - li -ls
  # projections of inertia axes on PCAIV axes
  s.corcircle(caiv1$as)
  
  # Species positions
  s.label(caiv1$c1, 2, 1, clab = 0.5, xlim = c(-4, 4))
  # Sites positions at the weighted mean of present species
  s.label(caiv1$ls, 2, 1, clab = 0, cpoi = 1, add.p = TRUE)
  
  # Prediction of the positions by regression on environmental variables
  s.match(caiv1$ls, caiv1$li, 2, 1, clab = 0.5)
  
  # analysis with fa - l1 - co -cor
  # canonical weights giving unit variance combinations
  s.arrow(caiv1$fa)
  
  # sites position by environmental variables combinations
  # position of species by averaging
  s.label(caiv1$l1, 2, 1, clab = 0, cpoi = 1.5)
  s.label(caiv1$co, 2, 1, add.plot = TRUE)
  
  s.distri(caiv1$l1, rpjdl$fau, 2, 1, cell = 0, csta = 0.33)
  s.label(caiv1$co, 2, 1, clab = 0.75, add.plot = TRUE)
  
  # coherence between weights and correlations
  par(mfrow = c(1, 2))
  s.corcircle(caiv1$cor, 2, 1)
  s.arrow(caiv1$fa, 2, 1)
  par(mfrow = c(1, 1))
}



