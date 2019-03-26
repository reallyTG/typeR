library(ade4)


### Name: kplot.sepan
### Title: Multiple Graphs for Separated Analyses in a K-tables
### Aliases: kplot.sepan kplotsepan.coa
### Keywords: multivariate hplot

### ** Examples

data(escopage)
w1 <- data.frame(scale(escopage$tab))
w1 <- ktab.data.frame(w1, escopage$blo, tabnames = escopage$tab.names)
sep1 <- sepan(w1)
if(adegraphicsLoaded()) {
  kplot(sep1, posieig = "none")
} else {
  kplot(sep1, show = FALSE)
}

data(friday87)
w2 <- data.frame(scale(friday87$fau, scal = FALSE))
w2 <- ktab.data.frame(w2, friday87$fau.blo, tabnames = friday87$tab.names)
if(adegraphicsLoaded()) {
  kplot(sepan(w2), row.plabel.cex = 1.25, col.plab.cex = 0)
} else {
  kplot(sepan(w2), clab.r = 1.25, clab.c = 0)
}

data(microsatt)
w3 <- dudi.coa(data.frame(t(microsatt$tab)), scann = FALSE)
loci.fac <- factor(rep(microsatt$loci.names, microsatt$loci.eff))
wit <- wca(w3, loci.fac, scann = FALSE)
microsatt.ktab <- ktab.within(wit)
if(adegraphicsLoaded()) {
  kplotsepan.coa(sepan(microsatt.ktab), posieig = "none", col.plab.cex = 0, row.plab.cex = 1.5)
} else {
  kplotsepan.coa(sepan(microsatt.ktab), show = FALSE, clab.c = 0, 
    mfrow = c(3,3), clab.r = 1.5)
}    



