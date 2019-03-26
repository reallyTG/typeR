library(clusteredinterference)


### Name: policyFX
### Title: Estimate Causal Effects of Population Treatment Policies
###   Assuming Clustered Interference
### Aliases: policyFX

### ** Examples

## Not run: 
##D data("toy_data", "clusteredinterference")
##D causal_fx <- policyFX(
##D   data = toy_data,
##D   formula = Outcome | Treatment ~ Age + Distance + (1 | Cluster_ID) | Cluster_ID,
##D   alphas = c(.3, .5),
##D   k_samps = 1,
##D   verbose = FALSE
##D )
## End(Not run)



