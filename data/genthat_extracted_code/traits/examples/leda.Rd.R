library(traits)


### Name: leda
### Title: Access LEDA trait data
### Aliases: leda

### ** Examples

## Not run: 
##D # Age of first flowering
##D leda(trait = "age_first_flowering")
##D 
##D # Seed number
##D leda("seed_number")
##D 
##D # Releasing height
##D leda(trait = "releasing_height")
##D 
##D # Clonal growth organs
##D leda(trait = "clonal_growth_organs")
##D 
##D all <- c("age_first_flowering", "branching", "buds_seasonality",
##D   "buds_vertical_dist", "canopy_height",
##D   "dispersal_type", "leaf_distribution", "ldmc_geo", "leaf_mass",
##D   "leaf_size", "morphology_disperal", "growth_form", "life_span",
##D   "releasing_height", "seed_longevity", "seed_mass",
##D   "seed_number", "seed_shape", "shoot_growth_form",
##D   "snp", "ssd", "tv", "clonal_growth_organs")
##D out <- list()
##D for (i in seq_along(all)) {
##D   cat(all[i], sep="\n")
##D   out[[i]] <- leda(all[i])
##D }
##D sapply(out, NROW)
## End(Not run)



