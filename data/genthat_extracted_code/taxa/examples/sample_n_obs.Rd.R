library(taxa)


### Name: sample_n_obs
### Title: Sample n observations from 'taxmap()'
### Aliases: sample_n_obs

### ** Examples

# Sample 2 rows without replacement
sample_n_obs(ex_taxmap, "info", 2)
sample_n_obs(ex_taxmap, "foods", 2)

# Sample with replacement
sample_n_obs(ex_taxmap, "info", 10, replace = TRUE)

# Sample some rows for often then others
sample_n_obs(ex_taxmap, "info", 3, obs_weight = n_legs)

# Sample multiple datasets at once
sample_n_obs(ex_taxmap, c("info", "phylopic_ids", "foods"), 3)




