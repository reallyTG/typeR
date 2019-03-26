library(strap)


### Name: StratPhyloCongruence
### Title: Calculates fit to stratigraphy metrics for a set of tree(s).
### Aliases: StratPhyloCongruence
### Keywords: congruence

### ** Examples

# Calculate stratigraphic fit measures treating ages as ranges
# (permutation numbers used are lower than recommended for standard use):
fit.to.strat.1 <- StratPhyloCongruence(trees=Dipnoi$tree, ages=Dipnoi$ages, rlen=0,
	method="basic", samp.perm=5, rand.perm=5, hard=TRUE,
	randomly.sample.ages=FALSE, fix.topology=TRUE, fix.outgroup=TRUE)
fit.to.strat.1 # View all output
names(fit.to.strat.1) # Show output options
fit.to.strat.1$input.tree.results # Show just the output for the input tree(s)

# Calculate stratigraphic fit measures treating ages as uncertainties
# (permutation numbers used are lower than recommended for standard use):
#fit.to.strat.2 <- StratPhyloCongruence(trees=Dipnoi$tree, ages=Dipnoi$ages, rlen=0,
#	method="basic", samp.perm=10, rand.perm=10, hard=TRUE,
#	randomly.sample.ages=TRUE, fix.topology=TRUE, fix.outgroup=TRUE)



