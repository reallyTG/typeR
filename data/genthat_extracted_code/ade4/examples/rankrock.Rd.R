library(ade4)


### Name: rankrock
### Title: Ordination Table
### Aliases: rankrock
### Keywords: datasets

### ** Examples

data(rankrock)
dudi1 <- dudi.pca(rankrock, scannf = FALSE, nf = 3)
if(adegraphicsLoaded()) {
  g <- scatter(dudi1, row.plab.cex = 1.5)
} else {
  scatter(dudi1, clab.r = 1.5)
}


