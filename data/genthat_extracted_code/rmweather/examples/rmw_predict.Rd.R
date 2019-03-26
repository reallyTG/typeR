library(rmweather)


### Name: rmw_predict
### Title: Function to predict using a *ranger* random forest.
### Aliases: rmw_predict

### ** Examples


# Make a prediction with the examples
vector_prediction <- rmw_predict(
  model_london, 
  df = rmw_prepare_data(data_london, value = "no2")
)


# Make a prediction with standard errors too
list_prediction <- rmw_predict(
  model_london, 
  df = rmw_prepare_data(data_london, value = "no2"),
  se = TRUE
)
 



