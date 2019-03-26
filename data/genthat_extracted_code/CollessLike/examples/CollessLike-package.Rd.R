library(CollessLike)


### Name: CollessLike-package
### Title: Distribution and Percentile of Sackin, Cophenetic and
###   Colless-Like Balance Indices of Phylogenetic Trees
### Aliases: CollessLike-package CollessLike
### Keywords: package

### ** Examples

# A random phylogenetic tree of 5 leaves between all trees with 5 leaves 
# following the alpha-gamma model with alpha=0.5 and gamma=0.3
a.g.tree = a.g.model(5,0.5,0.3)
# To compute the percentile of that tree of the Colless-Like,
# Sackin and cophenetic normalized balance indices under the alpha-gamma
# model with alpha=0.5 and gamma=0.3, and a distribution plot.
#distribution(a.g.tree,0.5,0.3,db.path=getwd())
# For a percentile plot set the parameter percentile.plot as TRUE
#distribution(a.g.tree,0.5,0.3,db.path=getwd(),percentile.plot=TRUE)
 
# Computation of the Colless-Like, Sackin and cophenetic balance indices
# of a sample of 50 trees that follow the alpha-gamma distribution
# with alpha=0.5 and gamma=0.3 with 5 leaves.
  indices.data = indices.simulation(5,0.5,0.3,50)
# Computation of the percentile of the random tree using the previous 
# generated sample  
  distribution(a.g.tree,0.5,0.3,set.indices=indices.data)



