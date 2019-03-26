library(taxa)


### Name: sample_frac_obs
### Title: Sample a proportion of observations from 'taxmap()'
### Aliases: sample_frac_obs

### ** Examples

# Sample half of the rows fram a table
sample_frac_obs(ex_taxmap, "info", 0.5)

# Sample multiple datasets at once
sample_frac_obs(ex_taxmap, c("info", "phylopic_ids", "foods"), 0.5)




