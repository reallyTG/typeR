library(adespatial)


### Name: msr.4thcorner
### Title: Moran spectral randomization for fourth-corner analysis
### Aliases: msr.4thcorner
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE) & require("adephylo", quietly = TRUE) 
& require("spdep", quietly = TRUE) & require("ape", quietly = TRUE)){
data(mafragh, package = "ade4")
fr1 <- fourthcorner(mafragh$env, mafragh$flo, mafragh$traits$tabQuantitative, nrepet = 49)
phy <- read.tree(text = mafragh$tre)
lw <- nb2listw(mafragh$nb)
fr1.msr <- msr(fr1, listwORorthobasis = lw, phyloORorthobasis = phy)

fr1
fr1.msr
}




