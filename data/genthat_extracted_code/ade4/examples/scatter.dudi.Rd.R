library(ade4)


### Name: scatter.dudi
### Title: Plot of the Factorial Maps
### Aliases: scatter.dudi
### Keywords: multivariate hplot

### ** Examples

data(deug)
scatter(dd1 <- dudi.pca(deug$tab, scannf = FALSE, nf = 4), 
    posieig = "bottomright")

data(rhone)
dd1 <- dudi.pca(rhone$tab, nf = 4, scann = FALSE)
if(adegraphicsLoaded()) {
  scatter(dd1, row.psub.text = "Principal component analysis")
} else {
  scatter(dd1, sub = "Principal component analysis")
}



