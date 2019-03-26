library(ade4)


### Name: mjrochet
### Title: Phylogeny and quantitative traits of teleos fishes
### Aliases: mjrochet
### Keywords: datasets

### ** Examples

data(mjrochet)
mjrochet.phy <- newick2phylog(mjrochet$tre)
tab <- log((mjrochet$tab))
tab0 <- data.frame(scalewt(tab))
table.phylog(tab0, mjrochet.phy, csi = 2, clabel.r = 0.75)
if (requireNamespace("adephylo", quietly = TRUE)) {
  adephylo::orthogram(tab0[,1], ortho = mjrochet.phy$Bscores)
}



