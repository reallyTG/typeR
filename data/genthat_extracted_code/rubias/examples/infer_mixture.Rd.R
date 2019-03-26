library(rubias)


### Name: infer_mixture
### Title: Estimate mixing proportions and origin probabilities from one or
###   several mixtures
### Aliases: infer_mixture

### ** Examples

mcmc <- infer_mixture(reference = small_chinook_ref,
                      mixture = small_chinook_mix,
                      gen_start_col = 5,
                      method = "MCMC",
                      reps  = 200)



