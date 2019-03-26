library(metricTester)


### Name: calcField
### Title: Calculate phylogenetic and trait fields
### Aliases: calcField

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#in this example, occasionally some species are not in the CDM, so prune the tree
#accordingly so as not to throw any errors
tree <- drop.tip(tree, setdiff(tree$tip.label, colnames(cdm)))

prepped <- prepFieldData(tree=tree, picante.cdm=cdm)

results <- calcField(prepped)



