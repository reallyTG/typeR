library(pcrcoal)


### Name: PCRcoal-class
### Title: The PCRcoal class
### Aliases: PCRcoal PCRcoal-class PCRcoal,missing-method
### Keywords: classes, coalescent, PCR, simulation

### ** Examples

	# Construct a PCRcoal object 
        # and specify the experimental conditions:
        sim <-PCRcoal(
        initial.size    =5,
        sample.size     =10,
        nr.cycles       =20,
        efficiencies    =c(rep(0.1, 30))
        )

	##
	## Method: sample.tree
	##

	 # Sample a coalescent tree:
        tree <- sample.tree(sim)

        # Print tree info:
        print(tree)

        # Plot the tree:
        plot(tree)
	
	##
	## Method: sample.tnt
	##

	# Sample a coalescent tree with subsample sizes and
	# size trajectories:
        res <- sample.tnt(sim)

        # Print subsample sizes:
        print(res$subsamples)

        # Print size trajectories:
        print(res$trajectories)

        # Print tree info:
        print(res$phylo)
	
	##
	## Method: sample.trs
	##

	# Sample subsample sizes and size trajectories:
        res <- sample.trs(sim)

        # Print subsample sizes:
        print(res$subsamples)

        # Print size trajectories:
        print(res$trajectories)

	##
	## Simulating mutations using PhyloSim
	##

	# Sample tree:
	tree <- sample.tree(sim)

	# Load the phylosim package
	library(phylosim)
	# Construct a PhyloSim object, set up the root
	# sequence and the substitution process:	
	psim <- PhyloSim(
		phylo = tree,
		root.seq=sampleStates( NucleotideSequence(length=10,processes=list(list(JC69())) ) )
	)
	# Scale the tree:	
	scaleTree(psim,0.1)

	# Simulate mutations:
	Simulate(psim)

	# Plot the resulting alignment:
	plot(psim,plot.ancestors=FALSE)



