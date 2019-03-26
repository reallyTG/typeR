library(mudata2)


### Name: update_datasets
### Title: Add documentation to mudata objects
### Aliases: update_datasets update_datasets.default update_locations
###   update_locations.default update_params update_params.default
###   update_columns update_columns.default

### ** Examples

kentvillegreenwood %>%
  update_datasets("ecclimate", new_key = "new_value") %>%
  tbl_datasets()



