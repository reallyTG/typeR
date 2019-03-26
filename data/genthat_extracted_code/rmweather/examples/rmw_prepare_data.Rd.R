library(rmweather)


### Name: rmw_prepare_data
### Title: Function to prepare a data frame for modelling with *rmweather*.
### Aliases: rmw_prepare_data

### ** Examples


# Keep things reproducible
set.seed(123)

# Prepare example data for modelling 
data_london_prepared <- rmw_prepare_data(data_london, value = "no2")




