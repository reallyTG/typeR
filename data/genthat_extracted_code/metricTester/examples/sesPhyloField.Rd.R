library(metricTester)


### Name: sesPhyloField
### Title: Calculate a species' standardized trait field
### Aliases: sesPhyloField

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#simulate log-normal abundances
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community data matrix with these inputs
cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#example trait field calculations
exampleField <- sesPhyloField(tree=tree, picante.cdm=cdm, 
	metric="naw.mpd", null="richness", randomizations=10)



