library(modelgrid)


### Name: add_model
### Title: Add a model specification to a model grid
### Aliases: add_model

### ** Examples

library(magrittr)

# Pre-allocate empty model grid.
mg <- model_grid()

# Add 'random forest' model spec.
mg <-
  mg %>%
  add_model(model_name = "Random Forest Test", method = "rf", tuneLength = 5)



