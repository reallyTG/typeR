library(ade4)


### Name: fission
### Title: Fission pattern and heritable morphological traits
### Aliases: fission
### Keywords: datasets

### ** Examples

data(fission)
fis.phy <- newick2phylog(fission$tre)
table.phylog(fission$tab[names(fis.phy$leaves),], fis.phy, csi = 2)
gearymoran(fis.phy$Amat, fission$tab)



