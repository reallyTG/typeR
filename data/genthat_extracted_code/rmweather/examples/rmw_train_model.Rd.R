library(rmweather)


### Name: rmw_train_model
### Title: Function to train a random forest model to predict (usually)
###   pollutant concentrations using meteorological and time variables.
### Aliases: rmw_train_model

### ** Examples


## No test: 

# Keep things reproducible
set.seed(123)

# Prepare example data
data_london_prepared <- rmw_prepare_data(data_london, value = "no2")

# Calculate a model using common meteorological and time variables
model <- rmw_train_model(
  data_london_prepared,
  variables = c(
    "ws", "wd", "air_temp", "rh", "date_unix", "day_julian", "weekday", "hour"
  ),
  n_trees = 300
)

## End(No test)




