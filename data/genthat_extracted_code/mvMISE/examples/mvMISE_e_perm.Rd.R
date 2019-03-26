library(mvMISE)


### Name: mvMISE_e_perm
### Title: A function to obtain permutation-based p-values for fixed
###   effects estimates in mvMISE_e
### Aliases: mvMISE_e_perm

### ** Examples

## No test: 

data(sim_dat)

pval_perm = mvMISE_e_perm(nperm = 100, Y = sim_dat$Y, X = sim_dat$X, id = sim_dat$id)
## End(No test)



