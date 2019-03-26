library(gaiah)


### Name: isotope_posterior_probs
### Title: compute posterior probabilities of origin given isotope values
### Aliases: isotope_posterior_probs

### ** Examples

# obtain posterior probability rasters for the first 2 birds in the migrant_wiwa_isotopes
# data set.  This takes about 15 seconds on my laptop (most of that time is preparatory---once
# that is done, each bird goes much faster). So we don't run it here.
## Not run: 
##D birds2 <- isotope_posterior_probs(isoscape = isomap_job54152_prediction,
##D                         ref_birds = breeding_wiwa_isotopes,
##D                         assign_birds = migrant_wiwa_isotopes[1:2,]
##D                         )
## End(Not run)

# However, you can load the results as a saved data object to see what they look like:
birds2 <- example_isotope_posteriors


# Since the ref_birds above were separate from the migrant birds, no leave-one-out was
# performed.  Hence birds2$loo_results is NULL, and all the results are in
# birds2$regular.

# Look at the names of the resulting output for the first bird:
names(birds2$regular[[1]])

names(birds2$regular[[1]]$assignment_parameters)



# If you want to do self-assignment for a whole bunch of reference birds, it takes much longer.
# It looks like this:
## Not run: 
##D self_ass <- isotope_posterior_probs(isoscape = isomap_job54152_prediction,
##D                                     ref_birds = breeding_wiwa_isotopes,
##D                                     self_assign = TRUE)
## End(Not run)



