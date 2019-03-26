library(modelgrid)


### Name: edit_model
### Title: Edit model within a model grid
### Aliases: edit_model

### ** Examples

library(magrittr)

# Create model grid and add random forest model.
mg <-
  model_grid() %>%
  add_model(model_name = "Random Forest Test", method = "rf", tuneLength = 5)

# Edit the size of tuning grid of the random forest model.
edit_model(mg, model_name = "Random Forest Test", tuneLength = 10)



