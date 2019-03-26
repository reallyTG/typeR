library(rmweather)


### Name: rmw_predict_the_test_set
### Title: Functions to use a model to predict the observations within a
###   test set after 'rmw_calculate_model'.
### Aliases: rmw_predict_the_test_set

### ** Examples


# Use the test set for prediction
rmw_predict_the_test_set(
  model_london, 
  df = rmw_prepare_data(data_london, value = "no2")
)

# Predict, then produce a hex plot of the predictions
rmw_predict_the_test_set(
  model_london, 
  df = rmw_prepare_data(data_london, value = "no2")
) %>% 
  rmw_plot_test_prediction()




