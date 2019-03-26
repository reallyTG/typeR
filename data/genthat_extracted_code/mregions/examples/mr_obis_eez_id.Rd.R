library(mregions)


### Name: mr_obis_eez_id
### Title: Get OBIS EEZ id
### Aliases: mr_obis_eez_id

### ** Examples

## Not run: 
##D # You can get EEZ names via the mr_names() function
##D (res <- mr_names('MarineRegions:eez_boundaries'))
##D mr_obis_eez_id(res$eez1[19])
##D 
##D # Or pass in a name
##D mr_obis_eez_id("Bulgarian Exclusive Economic Zone")
##D 
##D # case doesn't matter
##D mr_obis_eez_id("bulgarian exclusive economic zone")
##D 
##D # No match, gives NULL
##D mr_obis_eez_id("stuff things")
## End(Not run)



