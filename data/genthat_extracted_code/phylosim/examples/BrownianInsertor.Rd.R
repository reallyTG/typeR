library(phylosim)


### Name: BrownianInsertor
### Title: The BrownianInsertor class
### Aliases: BrownianInsertor

### ** Examples

	# create a BrownianInsertor process, discrete type
	p<-BrownianInsertor(
                       type="discrete",
                       scale=0.05,
                       sizes=1:4,
                       probs=c(3/6,1/6,1/6,1/6),
                       rate=0.05
                       )
	# get object summary
	summary(p)
	# plot insert length distribution
	plot(p)
	# create a nucleotide sequence, attach processes
	s<-NucleotideSequence(string="AAAAAAAAAAA",processes=list(list(p,JC69())))
	# create simulation object
	sim<-PhyloSim(root.seq=s, phylo=rcoal(2))
	# simulate and show alignment
	Simulate(sim)
	sim$alignment
	# check the rate multipliers and insertion tolerances in one of the sequences
	res<-sim$sequences[[2]]
	getRateMultipliers(res,p)
	getInsertionTolerance(res,p)
 


