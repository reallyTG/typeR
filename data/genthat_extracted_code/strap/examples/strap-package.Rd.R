library(strap)


### Name: strap-package
### Title: Stratigraphic Tree Analysis for Palaeontology
### Aliases: strap-package strap
### Keywords: phylogeny

### ** Examples

# Calculate stratigraphic fit measures treating ages as ranges:
fit.to.strat.1 <- StratPhyloCongruence(trees=Dipnoi$tree, ages=Dipnoi$ages, rlen=0,
	method="basic", samp.perm=5, rand.perm=5, hard=TRUE,
	randomly.sample.ages=FALSE, fix.topology=FALSE, fix.outgroup=TRUE)
	
fit.to.strat.1$input.tree.results # Show just the output for the input tree(s)



