library(negenes)


### Name: negenes
### Title: Estimate the number of essential genes in a genome
### Aliases: negenes
### Keywords: models

### ** Examples

data(Mtb80)

# simulate 44% of genes to be essential
essential <- rep(0,nrow(Mtb80))
essential[sample(1:nrow(Mtb80),ceiling(nrow(Mtb80)*0.44))] <- 1

# simulate 759 mutants
counts <- sim.mutants(Mtb80[,1], essential, Mtb80[,2], 759)

# run the Gibbs sampler without returning detailed output
## Not run: output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2])
## Don't show: 
output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2],
                            n.mcmc=100, skip=0, burnin=0)
## End(Don't show)
# run the Gibbs sampler, returning the detailed output
## Not run: output2 <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2], return=TRUE)
## Don't show: 
output2 <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2], return=TRUE,
                            n.mcmc=100, skip=0, burnin=0)
## End(Don't show)



