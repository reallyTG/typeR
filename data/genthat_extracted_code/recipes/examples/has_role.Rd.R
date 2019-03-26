library(recipes)


### Name: has_role
### Title: Role Selection
### Aliases: has_role all_predictors all_outcomes has_type all_numeric
###   all_nominal current_info
### Keywords: datagen

### ** Examples

data(biomass)

rec <- recipe(biomass) %>%
  update_role(
    carbon, hydrogen, oxygen, nitrogen, sulfur,
    new_role = "predictor"
  ) %>%
  update_role(HHV, new_role = "outcome") %>%
  update_role(sample, new_role = "id variable") %>%
  update_role(dataset, new_role = "splitting indicator")

recipe_info <- summary(rec)
recipe_info

# Centering on all predictors except carbon
rec %>%
  step_center(all_predictors(), -carbon) %>%
  prep(training = biomass, retain = TRUE) %>%
  juice()




