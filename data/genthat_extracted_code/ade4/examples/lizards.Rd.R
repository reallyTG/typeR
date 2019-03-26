library(ade4)


### Name: lizards
### Title: Phylogeny and quantitative traits of lizards
### Aliases: lizards
### Keywords: datasets

### ** Examples

data(lizards)
w <- data.frame(scalewt(log(lizards$traits)))
par(mfrow = c(1,2))
wphy <- newick2phylog(lizards$hprA)
table.phylog(w, wphy, csi = 3)
wphy <- newick2phylog(lizards$hprB)
table.phylog(w, wphy, csi = 3)
par(mfrow = c(1,1))



