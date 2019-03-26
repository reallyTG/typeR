library(ade4)


### Name: seconde
### Title: Students and Subjects
### Aliases: seconde
### Keywords: datasets

### ** Examples

data(seconde)
if(adegraphicsLoaded()) {
  scatter(dudi.pca(seconde, scan = FALSE), row.plab.cex = 1, col.plab.cex = 1.5)
} else {
  scatter(dudi.pca(seconde, scan = FALSE), clab.r = 1, clab.c = 1.5)
}



