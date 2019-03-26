library(ade4)


### Name: deug
### Title: Exam marks for some students
### Aliases: deug
### Keywords: datasets

### ** Examples

data(deug)
# decentred PCA
pca1 <- dudi.pca(deug$tab, scal = FALSE, center = deug$cent, scan = FALSE)
  
if(adegraphicsLoaded()) {
  g1 <- s.class(pca1$li, deug$result, plot = FALSE)
  g2 <- s.arrow(40 * pca1$c1, plot = FALSE)
  G <- superpose(g1, g2, plot = TRUE)
  
} else {
  s.class(pca1$li, deug$result)
  s.arrow(40 * pca1$c1, add.plot = TRUE)
}



