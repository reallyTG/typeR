library(bdvis)


### Name: format_bdvis
### Title: Prepare data frame for flagging functions
### Aliases: format_bdvis

### ** Examples

## Not run: 
##D # Using the rgbif package and the source argument
##D if (requireNamespace("rinat", quietly=TRUE)) {
##D  d <- get_inat_obs_project("reptileindia") 
##D  d <- format_bdvis(d, source="rinat")
##D 
##D  # Using a configuration object, matches 'rinat' schema
##D  conf <- list(Latitude="latitude",
##D               Longitude="longitude",
##D               Date_collected="Observed.on",
##D               Scientific_name="Scientific.name")
##D  d <- format_bdvis(d, config=conf)
##D 
##D  # Passing individual parameters, all optional
##D  d <- format_bdvis(d,
##D                 Latitude="lat",
##D                 Longitude="lng",
##D                 Date_collected="ObservedOn",
##D                 Scientific_name="sciname")
##D }
## End(Not run)




