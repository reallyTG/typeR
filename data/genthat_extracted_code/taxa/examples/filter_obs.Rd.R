library(taxa)


### Name: filter_obs
### Title: Filter observations with a list of conditions
### Aliases: filter_obs

### ** Examples

# Filter by row index
filter_obs(ex_taxmap, "info", 1:2)

# Filter by TRUE/FALSE
filter_obs(ex_taxmap, "info", dangerous == FALSE)
filter_obs(ex_taxmap, "info", dangerous == FALSE, n_legs > 0)
filter_obs(ex_taxmap, "info", n_legs == 2)

# Remove taxa whose obserservations were filtered out
filter_obs(ex_taxmap, "info", n_legs == 2, drop_taxa = TRUE)

# Preserve other data sets while removing taxa
filter_obs(ex_taxmap, "info", n_legs == 2, drop_taxa = TRUE,
           drop_obs = c(abund = FALSE))

# When filtering taxa, do not return supertaxa of taxa that are preserved
filter_obs(ex_taxmap, "info", n_legs == 2, drop_taxa = TRUE,
           supertaxa = FALSE)

# Filter multiple datasets at once
filter_obs(ex_taxmap, c("info", "phylopic_ids", "foods"), n_legs == 2)




