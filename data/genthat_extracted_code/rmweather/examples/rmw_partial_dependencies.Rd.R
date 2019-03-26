library(rmweather)


### Name: rmw_partial_dependencies
### Title: Function to calculate partial dependencies after training with
###   *rmweather*.
### Aliases: rmw_partial_dependencies

### ** Examples


## No test: 

# Ranger package needs to be loaded
library(ranger)

# Calculate partial dependencies for wind speed
data_partial <- rmw_partial_dependencies(
  model = model_london, 
  df = rmw_prepare_data(data_london, value = "no2"), 
  variable = "ws", 
  verbose = TRUE
)

# Calculate partial dependencies for all independent variables used in model
data_partial <- rmw_partial_dependencies(
  model = model_london, 
  df = rmw_prepare_data(data_london, value = "no2"), 
  variable = NA, 
  verbose = TRUE
)

## End(No test)




