library(synthACS)


### Name: pull_synth_data
### Title: Pull ACS data for synthetic data creation.
### Aliases: pull_synth_data

### ** Examples

## Not run: 
##D # make geography
##D la_geo <- acs::geo.make(state= "CA", county= "Los Angeles", tract= "*")
##D # pull data elements for creating synthetic data
##D la_dat <- pull_synth_data(2014, 5, la_geo)
## End(Not run)



