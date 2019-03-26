library(prabclus)


### Name: build.ext.nblist
### Title: Internal: generates neighborhood list for diploid loci
### Aliases: build.ext.nblist
### Keywords: cluster

### ** Examples

  data(veronica)
  vnb <- coord2dist(coordmatrix=veronica.coord[1:20,], cut=20,
    file.format="decimal2",neighbors=TRUE)
  build.ext.nblist(vnb$nblist)



