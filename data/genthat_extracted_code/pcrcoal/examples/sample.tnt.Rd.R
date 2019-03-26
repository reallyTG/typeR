library(pcrcoal)


### Name: sample.tnt
### Title: Sample a coalescent tree according to a PCR experiment, return
###   also subsample sizes and size trajectories
### Aliases: sample.tnt sample.tnt,PCRcoal-method
### Keywords: PCR, simulation

### ** Examples

	# Construct a PCRcoal object 
	# and specify the experimental conditions:
	sim <-PCRcoal(
        initial.size    =5,
        sample.size     =10,
        nr.cycles       =30,
        efficiencies    =c(rep(0.1, 30))
    	)

	# Sample a coalescent tree with subsample sizes and
    # size trajectories:
	res <- sample.tnt(sim)

	# Print subsample sizes:
	print(res$subsamples)
	
	# Print size trajectories:
	print(res$trajectories)

	# Print tree info:
	print(res$phylo)

	# Plot the tree:
	plot(res$phylo)



