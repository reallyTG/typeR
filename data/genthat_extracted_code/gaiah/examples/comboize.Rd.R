library(gaiah)


### Name: comboize
### Title: combine genetics, isotopes, and habitat raster with exponents as
###   given
### Aliases: comboize

### ** Examples

# first, run through the example for isotope_posterior_probs() to get
# the rasters for two migrant birds. This gives us the list "birds2"
example(isotope_posterior_probs)

# extract the posterior probs rasters from  that output into a raster stack
miso <- lapply(birds2$regular, function(x) x$posterior_probs) %>%
  raster::stack()

# see the names of the birds we are dealing with:
names(miso)

# get the genetic posteriors for those two birds
mig_gen2 <- migrant_wiwa_genetic_posteriors %>%
  dplyr::filter(ID %in% c(names(miso)))

# make genetic posterior rasters for those two birds, make sure they are
# sorted in the same order as miso, and make a raster stack of it
mgen <- genetic_posteriors2rasters(G = mig_gen2, R = genetic_regions)[names(miso)] %>%
  raster::stack()

# make a normalized prior from habitat quality that is zeros everywhere
# outside of the "known" range.
tmp <- wiwa_habitat_unclipped * wiwa_breed
mhab <- tmp / raster::cellStats(tmp, sum)

# combine genetics, isotopes and habitat with exponents of 1 on each
mcombo <- comboize(mgen, miso, mhab, 1, 1, 1)



