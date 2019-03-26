library(rmweather)


### Name: rmw_normalise
### Title: Function to normalise a variable for "average" meteorological
###   conditions.
### Aliases: rmw_normalise

### ** Examples


## No test: 

# Normalise the example no2 data
data_normalised <- rmw_normalise(
  model_london, 
  df = rmw_prepare_data(data_london, value = "no2"), 
  n_samples = 300,
  verbose = TRUE
)

## End(No test)




