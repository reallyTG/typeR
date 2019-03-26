library(negenes)


### Name: sim.mutants
### Title: Simulate data for a random transposon mutagenesis experiment
### Aliases: sim.mutants
### Keywords: datagen

### ** Examples

## Not run: 
##D data(Mtb80)
##D 
##D # simulate 44% of genes to be essential
##D essential <- rep(0,nrow(Mtb80))
##D essential[sample(1:nrow(Mtb80),ceiling(nrow(Mtb80)*0.44))] <- 1
##D 
##D # simulate 759 mutants
##D counts <- sim.mutants(Mtb80[,1], essential, Mtb80[,2], 759)
##D 
##D # run the Gibbs sampler
##D output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2])
## End(Not run)



