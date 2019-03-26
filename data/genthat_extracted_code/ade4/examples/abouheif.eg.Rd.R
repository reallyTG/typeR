library(ade4)


### Name: abouheif.eg
### Title: Phylogenies and quantitative traits from Abouheif
### Aliases: abouheif.eg
### Keywords: datasets

### ** Examples

data(abouheif.eg)
par(mfrow=c(2,2))
symbols.phylog(newick2phylog(abouheif.eg$tre1), abouheif.eg$vec1,
 sub = "Body Mass (kg)", csi = 2, csub = 2)
symbols.phylog(newick2phylog(abouheif.eg$tre2), abouheif.eg$vec2,
 sub = "Body Mass (kg)", csi = 2, csub = 2)
dotchart.phylog(newick2phylog(abouheif.eg$tre1), abouheif.eg$vec1,
 sub = "Body Mass (kg)", cdot = 2, cnod = 1, possub = "topleft",
  csub = 2, ceti = 1.5)
dotchart.phylog(newick2phylog(abouheif.eg$tre2), abouheif.eg$vec2,
 sub = "Body Mass (kg)", cdot = 2, cnod = 1, possub = "topleft",
  csub = 2, ceti = 1.5)
par(mfrow = c(1,1))

w.phy=newick2phylog(abouheif.eg$tre3)
dotchart.phylog(w.phy,abouheif.eg$vec3, clabel.n = 1)



