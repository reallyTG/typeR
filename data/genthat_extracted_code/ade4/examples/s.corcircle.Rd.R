library(ade4)


### Name: s.corcircle
### Title: Plot of the factorial maps of a correlation circle
### Aliases: s.corcircle
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  data (olympic)
  dudi1 <- dudi.pca(olympic$tab, scan = FALSE) # a normed PCA
  par(mfrow = c(2, 2))
  s.corcircle(dudi1$co, lab = names(olympic$tab))
  s.corcircle(dudi1$co, cgrid = 0, full = FALSE, clab = 0.8)
  s.corcircle(dudi1$co, lab = as.character(1:11), cgrid = 2, 
    full = FALSE, sub = "Correlation circle", csub = 2.5, 
    possub = "bottomleft", box = TRUE)
  s.arrow(dudi1$co, clab = 1)
  par(mfrow = c(1, 1))
}


