library(taxa)


### Name: arrange_obs
### Title: Sort user data in 'taxmap()' objects
### Aliases: arrange_obs

### ** Examples

# Sort in ascending order
arrange_obs(ex_taxmap, "info", n_legs)
arrange_obs(ex_taxmap, "foods", name)

# Sort in decending order
arrange_obs(ex_taxmap, "info", desc(n_legs))

# Sort multiple datasets at once
arrange_obs(ex_taxmap, c("info", "phylopic_ids", "foods"), n_legs)




