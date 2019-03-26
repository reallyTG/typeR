library(paleotree)


### Name: plotTraitgram
### Title: Plot a Traitgram for Continuous Traits
### Aliases: plotTraitgram

### ** Examples


set.seed(444)
tree <- rtree(10)
trait <- rTraitCont(tree)

#first, traitgram without conf intervals
plotTraitgram(trait,tree,conf.int = FALSE)

#now, with
plotTraitgram(trait,tree)
#not much confidence, eh?

# plotting simulated data
    # with values for ancestral nodes as input
trait <- rTraitCont(tree, ancestor = TRUE)
plotTraitgram(tree = tree,trait = trait)




