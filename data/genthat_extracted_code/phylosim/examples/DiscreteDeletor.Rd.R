library(phylosim)


### Name: DiscreteDeletor
### Title: The DiscreteDeletor class
### Aliases: DiscreteDeletor

### ** Examples

	# create a DiscreteDeletor process
	d<-DiscreteDeletor(
		name="M.D.",
		rate=0.25,
		sizes=c(1,2),
		probs=c(1/2,1/2)
 	)
	# get object summary
	summary(d)
	# set/get deletions sizes
	d$sizes<-1:3
	d$sizes
	# set/get length probabilities
	d$probs<-c(3,2,1)/6
	d$probs
	# plot length distribution
	plot(d)

	# The following code illustrates how to use
	# a DiscreteDeletor process in a simulation

	# create a sequence object, attach process d
	s<-NucleotideSequence(string="AAAAAAAAAAGGGGAAAAAAAAAA",processes=list(list(d)))
	# set the deletion tolerance to zero in the range 11:15
	# creating a region rejecting all deletions
	setDeletionTolerance(s,d,0,11:15)
	# get deletion tolerances
	getDeletionTolerance(s,d)
	# create a simulation object
	sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
	# simulate
	Simulate(sim)
	# print resulting alignment
	sim$alignment
 


