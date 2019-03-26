library(datafsm)


### Name: evolve_model_ntimes
### Title: Use a Genetic Algorithm to Estimate a Finite-state Machine Model
###   n-times
### Aliases: evolve_model_ntimes

### ** Examples

## Not run: 
##D # Create data:
##D cdata <- data.frame(period = rep(1:10, 1000),
##D                    outcome = rep(1:2, 5000),
##D                    my.decision1 = sample(1:0, 10000, TRUE),
##D                    other.decision1 = sample(1:0, 10000, TRUE))
##D (res <- evolve_model_ntimes(cdata, ntimes=2))
##D (res <- evolve_model_ntimes(cdata, return_best = FALSE, ntimes=2))
## End(Not run)




