library(phylosim)


### Name: PhyloSim
### Title: The PhyloSim class
### Aliases: PhyloSim phylosim

### ** Examples

   set.seed(1)
	## The following examples demonstrate
	## the typical use of the framework.
	## See the package vignette and
	## \url{http://github.com/bsipos/phylosim/tree/master/examples/}

	## The ll() method gives information about the methods defined
	## in the immediate class of an object.
	## Useful when exploring the framework.

	s<-Sequence()
	ll(s)
	ll(PhyloSim())
	ll(GTR())

	## Example 1 - A short simulation:
	## simulate nucleotide seqeunces and display
	## the resulting alignment matrix.

	Simulate(
		PhyloSim(phy=rcoal(3),
       root=NucleotideSequence(string="ATGC", proc=list(list(JC69())) ) )
	)$alignment

	# Construct a phylo object for the following
	# simulations, scale total tree length to 1:

	tmp<-PhyloSim(phylo=rcoal(3))
	scaleTree(tmp,1/tmp$treeLength)
	tmp$treeLength
	t<-tmp$phylo

	## Example 3 - simulating rate variation,
	## insertions and deletions.
	## See the examples/example_3_clean.R file
	## in the phylosim GitHub repository.

	# construct a GTR process object
       gtr<-GTR(
		name="MyGTR",
               rate.params=list(
                       "a"=1, "b"=2, "c"=3,
                       "d"=1, "e"=2, "f"=3
               ),
               base.freqs=c(2,2,1,1)/6
       )
	# get object summary
	summary(gtr)
	# display a bubble plot
	plot(gtr)

	# construct root sequence object
	s<-NucleotideSequence(length=20)
	# attach process via virtual field
	s$processes<-list(list(gtr))
	# sample states from the equilibrium
	# distribution of the attached processes
	sampleStates(s)
	# create among-site rate variation by sampling
	# the "rate.multiplier" site-process-specific parameter
	# from a discrete gamma distribution (GTR+G).
	plusGamma(s,gtr,shape=0.1)
	# make the range 11:12 invariable
	setRateMultipliers(s,gtr,0,11:12)
	# get the rate multipliers for s and gtr
	getRateMultipliers(s,gtr)

	# proposing lengths in the range 1:3
	d<-DiscreteDeletor(
		rate=0.1,
		name="MyDel",
		sizes=c(1:3),
		probs=c(3/6,2/6,1/6)
	)
	# get object
	summary(d)
	# plot deletion length distribution
	plot(d)
	# attach deletion process d to sequence s
	attachProcess(s,d)
 	# create a region rejecting all deletions
       setDeletionTolerance(s,d,0,11:12)

	# construct an insertion process object
	# proposing lengths in the range 1:3
	i<-DiscreteInsertor(
		rate=0.1,
		name="MyDel",
		sizes=c(1:2),
		probs=c(1/2,1/2),
		template.seq=NucleotideSequence(length=1,processes=list(list(JC69())))
	)
 	# states will be sampled from the JC69 equilibrium distribution
	# get object
	summary(i)
	# plot insertion length distribution
	plot(i)
	# attach insertion process i to sequence s
	attachProcess(s,i)
 	# create a region rejecting all insertions
       setInsertionTolerance(s,i,0,11:12)

	# plot total site rates
	plot(s)
	# construct simulation object
	sim<-PhyloSim(root.seq=s, phylo=t)
	# get object summary
	summary(sim)
	# plot tree
	plot(sim)
	# run simulation
	Simulate(sim)
 	# get the list of recorded per-branch event counts
 	getBranchEvents(sim)
	# export the number of substitutions as a phylo object
	subst<-exportStatTree(sim,"substitution")
	# plot the exported phylo object
	plot(subst)
	# plot tree and alignment
	plot(sim)
	# save and display alingment
	file<-paste("PhyloSim_dummy_fasta_",Sys.getpid(),".fas",sep="");
	saveAlignment(sim,file=file);
	# print out the Fasta file
	cat(paste(scan(file=file,what=character(),sep="\n"),collapse="\n"));cat("\n");
	# delete Fasta file
	unlink(file);

   # See \url{http://github.com/bsipos/phylosim/tree/master/examples/examples_class.R}
   # for the full list of PhyloSim constructor examples.
 
	## See the package vignette and
	## the GitHub repository for even more examples.
 


