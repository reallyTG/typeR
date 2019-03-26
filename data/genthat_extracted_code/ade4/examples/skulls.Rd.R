library(ade4)


### Name: skulls
### Title: Morphometric Evolution
### Aliases: skulls
### Keywords: datasets

### ** Examples

data(skulls)
pca1 <- dudi.pca(skulls, scan = FALSE)
fac <- gl(5, 30)
levels(fac) <- c("-4000", "-3300", "-1850", "-200", "+150")
dis.skulls <- discrimin(pca1, fac, scan = FALSE)
if(!adegraphicsLoaded())
  plot(dis.skulls, 1, 1)



