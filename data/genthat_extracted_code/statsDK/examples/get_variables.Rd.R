library(statsDK)


### Name: get_variables
### Title: Extracts variables from the list of meta data
### Aliases: get_variables

### ** Examples

metadata <- statsDK::retrieve_metadata("BEV3A")
dplyr::glimpse(metadata)

# See the variables as a data frame
variables <- get_variables(metadata)
dplyr::glimpse(variables)




