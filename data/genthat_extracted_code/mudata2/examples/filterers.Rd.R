library(mudata2)


### Name: filter_datasets
### Title: Subset a mudata object by complex expression
### Aliases: filter_datasets filter_datasets.default filter_data
###   filter_data.default filter_locations filter_locations.default
###   filter_params filter_params.default

### ** Examples

# select only locations with a latitude above 45
ns_climate %>%
  filter_locations(latitude > 45)

# select only params measured in mm
ns_climate %>%
  filter_params(unit == "mm")

# select only june temperature from ns_climate
library(lubridate)
ns_climate %>%
  filter_data(month(date) == 6)




