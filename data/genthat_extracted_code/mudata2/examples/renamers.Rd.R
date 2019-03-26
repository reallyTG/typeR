library(mudata2)


### Name: rename_locations
### Title: Rename identifiers in a mudata object
### Aliases: rename_locations rename_locations.default rename_params
###   rename_params.default rename_datasets rename_datasets.default
###   rename_columns rename_columns.default

### ** Examples

rename_datasets(kentvillegreenwood, avalley = ecclimate)
rename_locations(kentvillegreenwood, Greenwood = starts_with("GREENWOOD"))
rename_params(kentvillegreenwood, max_temp = maxtemp)
rename_columns(kentvillegreenwood, lon = longitude, lat = latitude)




