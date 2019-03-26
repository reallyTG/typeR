library(ade4)


### Name: chazeb
### Title: Charolais-Zebus
### Aliases: chazeb
### Keywords: datasets

### ** Examples

data(chazeb)
if(!adegraphicsLoaded())
  plot(discrimin(dudi.pca(chazeb$tab, scan = FALSE), 
    chazeb$cla, scan = FALSE))



