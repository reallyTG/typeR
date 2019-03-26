library(poweRlaw)


### Name: bootstrap_moby
### Title: Example bootstrap results for the full Moby Dick data set
### Aliases: bootstrap_moby bootstrap_p_moby

### ** Examples

## Generate the bootstrap_moby data set
## Not run: 
##D data(moby)
##D m = displ$new(moby)
##D bs = bootstrap(m, no_of_sims=5000, threads=4, seed=1)
## End(Not run)

#' ## Generate the bootstrap_p_moby data set
## Not run: 
##D bs_p = bootstrap_p(m, no_of_sims=5000, threads=4, seed=1)
## End(Not run)




