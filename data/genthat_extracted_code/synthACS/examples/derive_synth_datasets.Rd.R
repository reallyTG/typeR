library(synthACS)


### Name: derive_synth_datasets
### Title: Derive synthetic micro datasets for a given geography.
### Aliases: derive_synth_datasets

### ** Examples

## Not run: 
##D # make geography
##D la_geo <- acs::geo.make(state= "CA", county= "Los Angeles", tract= "*")
##D # pull data elements for creating synthetic data
##D la_dat <- pull_synth_data(2014, 5, la_geo)
##D # derive synthetic data
##D la_synthetic <- derive_synth_datasets(la_dat, leave_cores= 0)
## End(Not run)



