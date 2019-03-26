library(ade4)


### Name: supcol
### Title: Projections of Supplementary Columns
### Aliases: supcol supcol.coa supcol.dudi
### Keywords: multivariate

### ** Examples

data(rpjdl)
rpjdl.coa <- dudi.coa(rpjdl$fau, scan = FALSE, nf = 4)
rpjdl.coa$co[1:3, ]
supcol(rpjdl.coa, rpjdl$fau[, 1:3])$cosup  #the same

data(doubs)
dudi1 <- dudi.pca(doubs$fish, scal = FALSE, scan = FALSE)
if(adegraphicsLoaded()) {
  g1 <- s.arrow(dudi1$co, plot = FALSE)
  g2 <- s.arrow(supcol(dudi1, data.frame(scalewt(doubs$env)))$cosup, plab.cex = 2, plot = FALSE)
  G <- superpose(g1, g2, plot = TRUE)
  
} else {
  s.arrow(dudi1$co)
  s.arrow(supcol(dudi1, data.frame(scalewt(doubs$env)))$cosup, add.p = TRUE, clab = 2)
  symbols(0, 0, circles = 1, inches = FALSE, add = TRUE)
}



