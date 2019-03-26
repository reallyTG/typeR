library(qtl)


### Name: plot.rfmatrix
### Title: Plot recombination fractions or LOD scores for a single marker
### Aliases: plot.rfmatrix
### Keywords: hplot

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=5)
## End(Don't show)
fake.f2 <- est.rf(fake.f2)
marker <- markernames(fake.f2, chr=5)[6]
lod <- pull.rf(fake.f2, "lod")
plot(lod, marker, bandcol="gray70")



