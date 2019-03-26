library(ade4)


### Name: tithonia
### Title: Phylogeny and quantitative traits of flowers
### Aliases: tithonia
### Keywords: datasets

### ** Examples

data(tithonia)
phy <- newick2phylog(tithonia$tre)
tab <- log(tithonia$tab + 1)
table.phylog(scalewt(tab), phy)
gearymoran(phy$Wmat, tab)
gearymoran(phy$Amat, tab)



