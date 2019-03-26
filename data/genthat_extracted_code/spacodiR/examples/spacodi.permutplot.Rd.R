library(spacodiR)


### Name: spacodi.permutplot
### Title: EXPERIMENTAL: plotting observed and expected community structure
###   across branching times of a phylogeny
### Aliases: spacodi.permutplot

### ** Examples

# load a species-by-plots matrix, along with a tree
data(sp.example)
attach(sp.example)
spl
phy

# generate a plot of observed and expected Bst
sp.permut=spacodi.by.nodes(sp.plot=spl, phy=phy, n.rep=10)
spacodi.permutplot(sp.permut,bty="n")



