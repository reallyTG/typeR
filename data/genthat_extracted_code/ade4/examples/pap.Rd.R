library(ade4)


### Name: pap
### Title: Taxonomy and quantitative traits of carnivora
### Aliases: pap
### Keywords: datasets

### ** Examples

data(pap)
taxo <- taxo2phylog(as.taxo(pap$taxo))
table.phylog(as.data.frame(scalewt(pap$tab)), taxo, csi = 2, clabel.nod = 0.6,
 f.phylog = 0.6)



