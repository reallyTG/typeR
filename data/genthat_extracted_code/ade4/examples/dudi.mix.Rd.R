library(ade4)


### Name: dudi.mix
### Title: Ordination of Tables mixing quantitative variables and factors
### Aliases: dudi.mix
### Keywords: multivariate

### ** Examples

data(dunedata)
dd1 <- dudi.mix(dunedata$envir, scann = FALSE)
if(adegraphicsLoaded()) {
  g1 <- scatter(dd1, row.plab.cex = 1, col.plab.cex = 1.5)
} else {
  scatter(dd1, clab.r = 1, clab.c = 1.5)
}

dd2 <- dudi.mix(dunedata$envir, scann = FALSE, add.square = TRUE)
if(adegraphicsLoaded()) {
  g2 <- scatter(dd2, row.plab.cex = 1, col.plab.cex = 1.5)
} else {
  scatter(dd2, clab.r = 1, clab.c = 1.5)
}  



