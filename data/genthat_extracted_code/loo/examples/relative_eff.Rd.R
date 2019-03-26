library(loo)


### Name: relative_eff
### Title: Convenience function for computing relative efficiencies
### Aliases: relative_eff relative_eff.default relative_eff.matrix
###   relative_eff.array relative_eff.function

### ** Examples

LLarr <- example_loglik_array()
LLmat <- example_loglik_matrix()
dim(LLarr)
dim(LLmat)

rel_n_eff_1 <- relative_eff(exp(LLarr))
rel_n_eff_2 <- relative_eff(exp(LLmat), chain_id = rep(1:2, each = 500))
all.equal(rel_n_eff_1, rel_n_eff_2)




