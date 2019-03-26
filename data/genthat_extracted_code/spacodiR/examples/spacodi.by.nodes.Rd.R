library(spacodiR)


### Name: spacodi.by.nodes
### Title: conducting randomization tests of turnover in diversity through
###   time
### Aliases: spacodi.by.nodes

### ** Examples

# load a species-by-plots matrix, along with a tree
data(sp.example)
attributes(sp.example)
attach(sp.example)
spl
phy

# generate a plot of observed and expected Bst
sp.permut<-spacodi.by.nodes(sp.plot=spl, phy=phy, n.rep=35)
sp.permut$randomization.test

# plot observed and expected Bst
spacodi.permutplot(spacodi.permutations=sp.permut, envelope=FALSE)




