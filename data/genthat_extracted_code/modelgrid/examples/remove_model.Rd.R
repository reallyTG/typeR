library(modelgrid)


### Name: remove_model
### Title: Remove model from model grid
### Aliases: remove_model

### ** Examples

library(magrittr)

# Pre-allocate empty model grid.
mg <- model_grid()

# Add random forest model.
mg <-
  mg %>%
  add_model(model_name = "Random Forest Test", method = "rf", tuneLength = 5)

# Remove random forest model again.
remove_model(mg, model_name = "Random Forest Test")



