library(recipes)


### Name: roles
### Title: Manually Alter Roles
### Aliases: roles add_role update_role
### Keywords: datagen

### ** Examples

data(biomass)

# Create the recipe manually
rec <- recipe(x = biomass)
rec
summary(rec)

rec <- rec %>%
  update_role(carbon, contains("gen"), sulfur, new_role = "predictor") %>%
  update_role(sample, new_role = "id variable") %>%
  update_role(dataset, new_role = "splitting variable") %>%
  update_role(HHV, new_role = "outcome")

rec
summary(rec)

# Add a secondary role for carbon
rec <- rec %>%
  add_role(carbon, new_role = "carbon predictor")

summary(rec)

# Now update only the "predictor" role of carbon to instead
# be an additional outcome
rec %>%
  update_role(carbon, new_role = "outcome", old_role = "predictor") %>%
  summary()




