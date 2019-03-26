library(adiv)


### Name: aptree
### Title: Hierarchical Partitioning of Evolutionary and Ecological
###   Patterns in the Organization of Phylogenetically-Structured Species
###   Assemblages
### Aliases: apd aptree plot.aptree abgaptree rtestaptree plot.rtestaptree
###   tecAptree pIa
### Keywords: models

### ** Examples

data(rockfish)
phy <- read.tree(text=rockfish$tre)
ABG <- abgaptree(phy, rockfish$fau, wcom="speciesab")
colSums(ABG)
A <- aptree(phy, rockfish$fau)
colSums(A)
plot(A)
P <- pIa(phy, rockfish$fau)
P
T <- apd(phy, rockfish$fau)
plot(T)
#R <- rtestaptree(phy, rockfish$fau, nrep=999, wcom="speciesab")
#plot(R)
TA <- tecAptree(phy)
TA$h



