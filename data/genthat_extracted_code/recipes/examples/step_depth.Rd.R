library(recipes)


### Name: step_depth
### Title: Data Depths
### Aliases: step_depth tidy.step_depth
### Keywords: datagen

### ** Examples


# halfspace depth is the default
rec <- recipe(Species ~ ., data = iris) %>%
  step_depth(all_predictors(), class = "Species")

rec_dists <- prep(rec, training = iris)

dists_to_species <- bake(rec_dists, new_data = iris)
dists_to_species

tidy(rec, number = 1)
tidy(rec_dists, number = 1)



