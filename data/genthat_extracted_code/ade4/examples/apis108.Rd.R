library(ade4)


### Name: apis108
### Title: Allelic frequencies in ten honeybees populations at eight
###   microsatellites loci
### Aliases: apis108
### Keywords: datasets

### ** Examples

data(apis108)
apis <- count2genet(as.data.frame(t(apis108)))
apis.pca <- dudi.pca(apis$tab, center = apis$center,
    scale = FALSE, scannf = FALSE, nf = 3)



