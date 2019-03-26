library(rstan)


### Name: expose_stan_functions
### Title: Expose user-defined Stan functions to R for testing and
###   simulation
### Aliases: expose_stan_functions get_stream get_rng

### ** Examples

## Not run: 
##D model_code <-
##D   '
##D   functions {
##D     real standard_normal_rng() {
##D       return normal_rng(0,1);
##D    }
##D   }
##D '
##D expose_stan_functions(stanc(model_code = model_code))
##D standard_normal_rng()
##D PRNG <- get_rng(seed = 3)
##D o <- get_stream()
##D standard_normal_rng(PRNG, o)
## End(Not run)



