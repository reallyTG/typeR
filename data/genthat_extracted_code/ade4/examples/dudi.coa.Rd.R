library(ade4)


### Name: dudi.coa
### Title: Correspondence Analysis
### Aliases: dudi.coa
### Keywords: multivariate

### ** Examples

data(rpjdl)
chisq.test(rpjdl$fau)$statistic
rpjdl.coa <- dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
sum(rpjdl.coa$eig)*rpjdl.coa$N # the same

if(adegraphicsLoaded()) {
  g1 <- s.label(rpjdl.coa$co, plab.cex = 0.6, lab = rpjdl$frlab, plot = FALSE)
  g2 <- s.label(rpjdl.coa$li, plab.cex = 0.6, plot = FALSE)
  cbindADEg(g1, g2, plot = TRUE)
} else {
  par(mfrow = c(1,2))
  s.label(rpjdl.coa$co, clab = 0.6, lab = rpjdl$frlab)
  s.label(rpjdl.coa$li, clab = 0.6)
  par(mfrow = c(1,1))
}

data(bordeaux)
db <- dudi.coa(bordeaux, scan = FALSE)
db
score(db)



