library(taxa)


### Name: n_obs
### Title: Count observations in 'taxmap()'
### Aliases: n_obs

### ** Examples

# Get number of observations for each taxon in first dataset
n_obs(ex_taxmap)

# Get number of observations in a specified data set
n_obs(ex_taxmap, "info")
n_obs(ex_taxmap, "abund")

# Filter taxa using number of observations in the first table
filter_taxa(ex_taxmap, n_obs > 1)




