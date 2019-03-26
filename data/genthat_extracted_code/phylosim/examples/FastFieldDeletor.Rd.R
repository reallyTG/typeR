library(phylosim)


### Name: FastFieldDeletor
### Title: The FastFieldDeletor class
### Aliases: FastFieldDeletor

### ** Examples

	# create a FastFieldDeletor object, default (geometric) type
	# length.param.1 is "lambda"
	p<-FastFieldDeletor(rate=1,length.param.1=0.9, tolerance.margin=0.8)
	# get type
	p$type
	# get object summary
	summary(p)
	# set/get lambda
	p$lengthParam1<-0.8
	p$lengthParam1
	# set/get tolerance margin
	p$toleranceMargin<-0.5
	p$toleranceMargin
	# create a nucleotide sequence, attach process
	s<-NucleotideSequence(length=30,processes=list(list(p)))
	# set state pattern
	s$states<-c("A","A","T","T","G","G","C","C")
	# sample deletion tolerances
	setDeletionTolerance(s,p,sample(seq(from=0,to=0.8,by=0.01),30,replace=TRUE))
	# plot deletion tolerance
	plotParametersAtSites(s,p,"deletion.tolerance")
	# simulate
	sim<-PhyloSim(root.seq=s, phylo=rcoal(2))
	Simulate(sim)
	# show alignment
	sim$alignment
 


