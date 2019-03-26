library(rmweather)


### Name: rmw_do_all
### Title: Function to train a random forest model to predict (usually)
###   pollutant concentrations using meteorological and time variables and
###   then immediately normalise a variable for "average" meteorological
###   conditions.
### Aliases: rmw_do_all

### ** Examples


## No test: 

# Keep things reproducible
set.seed(123)

# Prepare example data
data_london_prepared <- rmw_prepare_data(data_london, value = "no2")

# Use the example data to conduct the steps needed for meteorological
# normalisation
list_normalised <- rmw_do_all(
  df = data_london_prepared,
  variables = c(
    "ws", "wd", "air_temp", "rh", "date_unix", "day_julian", "weekday", "hour"
  ),
  n_trees = 300,
  n_samples = 300
)

## End(No test)




