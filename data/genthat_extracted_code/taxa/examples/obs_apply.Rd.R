library(taxa)


### Name: obs_apply
### Title: Apply function to observations per taxon
### Aliases: obs_apply

### ** Examples

# Find the average number of legs in each taxon
obs_apply(ex_taxmap, "info", mean, value = "n_legs", simplify = TRUE)

# One way to implement `n_obs` and find the number of observations per taxon
obs_apply(ex_taxmap, "info", length, simplify = TRUE)




