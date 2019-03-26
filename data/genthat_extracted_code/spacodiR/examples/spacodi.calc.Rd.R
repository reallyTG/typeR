library(spacodiR)


### Name: spacodi.calc
### Title: measuring spatial and phylogenetic structuring of diversity in
###   communities
### Aliases: spacodi.calc

### ** Examples

# load a species-by-plots matrix, along with a tree
data(sp.example)
attributes(sp.example)
attach(sp.example)
spl
phy

# community diversity statistics of Hardy and Senterre (2007): tree-based
spacodi.calc(sp.plot = spl, phy = phy)

# community diversity statistics: trait-based with pairwise comparisons
spacodi.calc(sp.plot = spl, phy = phy, pairwise=TRUE)

# community diversity for a pair of traits
spacodi.calc(sp.plot = spl, sp.traits = trt, all.together=TRUE)

# community diversity for a pair of traits, each singly
spacodi.calc(sp.plot = spl, sp.traits = trt, all.together=FALSE)

# Ist: using abundance data only				
spacodi.calc(sp.plot = spl)	

# calculations with missing taxa between tree and sp.plot
# excluding the last five species in sp.plot, 
spacodi.calc(sp.plot = spl[1:15,], phy = phy, prune=TRUE)

# as before but with 'manual' pruning of the datasets
match.spacodi.data(sp.plot=spl[1:15,],phy=phy) -> prn.data
spacodi.calc(sp.plot=prn.data$sp.plot, phy=prn.data$sp.tree)
prn.data$sp.plot
prn.data$sp.tree


							



