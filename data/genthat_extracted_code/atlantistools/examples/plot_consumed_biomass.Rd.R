library(atlantistools)


### Name: plot_consumed_biomass
### Title: Circle diagram to visualize the consumed biomass for the whole
###   system.
### Aliases: plot_consumed_biomass

### ** Examples


## Not run: 
##D # Need to fix NAs in init cdf at some point.
##D plot_consumed_biomass(ref_bio_cons)
##D plot_consumed_biomass(ref_bio_cons, select_time = 1.8)
##D plot_consumed_biomass(ref_bio_cons, select_time = 1.8, show = 0.99)
##D 
##D # Add some gns testing.
##D load("z:/Atlantis_models/Runs/dummy_01_ATLANTIS_NS/preprocess-north-sea.rda", verbose = T)
##D plot_consumed_biomass(result$biomass_consumed, show = 0.95, select_time = 2.2)
##D 
##D times <- c(0.2, seq(10, 90, 10), 99.8)
##D par(mfcol = c(3, 4))
##D for (i in seq_along(times)) {
##D   plot_consumed_biomass(result$biomass_consumed, show = 0.95, select_time = times[i])
##D }
##D 
##D times <- seq(0.2, 2.2, 0.2)
##D # times <- times[times != 1]
##D par(mfcol = c(3, 4))
##D for (i in seq_along(times)) {
##D   plot_consumed_biomass(result$biomass_consumed, show = 0.95, select_time = times[i])
##D }
## End(Not run)



