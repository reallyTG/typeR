library(rjmcmc)


### Name: getsampler
### Title: Define Function To Sample From Coda Output
### Aliases: getsampler

### ** Examples

# Generate synthetic 'MCMC output' for a model with 3 parameters. There is
# one column per parameter, and 1000 iterations.
coda_output = matrix(c(runif(1000,0,1), rnorm(1000,5,2), rgamma(1000,2,2)), 1000, 3)

getsampler(modelfit=coda_output, sampler.name="posterior1")
set.seed(100)
posterior1()

## Alternatively
posterior1b = getsampler(modelfit=coda_output)  # this successfully defines a function named
# posterior1b but also defines an identical function corresponding to the value 
# of sampler.name, i.e. the default "post.draw" in this case.
set.seed(100)
posterior1b()
set.seed(100)
posterior1()




