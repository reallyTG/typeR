library(censusapi)


### Name: listCensusMetadata
### Title: Get variable or geography metadata for a given API as a data
###   frame
### Aliases: listCensusMetadata
### Keywords: metadata

### ** Examples

bds_vars <- listCensusMetadata(name = "timeseries/bds/firms", type = "variables")
head(bds_vars)

bds_geos <- listCensusMetadata(name = "timeseries/bds/firms", type = "geography")
head(bds_geos)

acs_geos <- listCensusMetadata(name = "acs/acs5", vintage = 2016, type = "geography")
head(acs_geos)

acs_groups <- listCensusMetadata(name = "acs/acs5", vintage = 2016, type = "groups")
head(acs_groups)



