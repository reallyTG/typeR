library(pcrcoal)


### Name: sample.trs
### Title: Sample subsample sizes and size trajectories according to a PCR
###   experiment
### Aliases: sample.trs sample.trs,PCRcoal-method
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

	# Sample subsample sizes and size trajectories:
	res <- sample.trs(sim)

	# Print subsample sizes:
	print(res$subsamples)

	# Print size trajectories:
	print(res$trajectories)




