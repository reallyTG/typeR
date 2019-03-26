library(taxa)


### Name: n_obs_1
### Title: Count observation assigned in 'taxmap()'
### Aliases: n_obs_1

### ** Examples

# Get number of observations for each taxon in first dataset
n_obs_1(ex_taxmap)

# Get number of observations in a specified data set
n_obs_1(ex_taxmap, "info")
n_obs_1(ex_taxmap, "abund")

# Filter taxa using number of observations in the first table
filter_taxa(ex_taxmap, n_obs_1 > 0)




