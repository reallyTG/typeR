library(pcrcoal)


### Name: sample.tree
### Title: Sample a coalescent tree according to a PCR experiment
### Aliases: sample.tree sample.tree,PCRcoal-method
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

	# Sample a coalescent tree:
	tree <- sample.tree(sim)

	# Print tree info:
	print(tree)

	# Plot the tree:
	plot(tree)
	



