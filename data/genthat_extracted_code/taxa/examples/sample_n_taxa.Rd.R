library(taxa)


### Name: sample_n_taxa
### Title: Sample n taxa from 'taxonomy()' or 'taxmap()'
### Aliases: sample_n_taxa

### ** Examples

# Randomly sample three taxa
sample_n_taxa(ex_taxmap, 3)

# Include supertaxa
sample_n_taxa(ex_taxmap, 3, supertaxa = TRUE)

# Include subtaxa
sample_n_taxa(ex_taxmap, 1, subtaxa = TRUE)

# Sample some taxa more often then others
sample_n_taxa(ex_taxmap, 3, supertaxa = TRUE,
              obs_weight = n_legs, obs_target = "info")




