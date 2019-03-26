library(recipes)


### Name: step_classdist
### Title: Distances to Class Centroids
### Aliases: step_classdist tidy.step_classdist
### Keywords: datagen

### ** Examples


# in case of missing data...
mean2 <- function(x) mean(x, na.rm = TRUE)

rec <- recipe(Species ~ ., data = iris) %>%
  step_classdist(all_predictors(), class = "Species",
                 pool = FALSE, mean_func = mean2)

rec_dists <- prep(rec, training = iris)

dists_to_species <- bake(rec_dists, new_data = iris, everything())
## on log scale:
dist_cols <- grep("classdist", names(dists_to_species), value = TRUE)
dists_to_species[, c("Species", dist_cols)]

tidy(rec, number = 1)
tidy(rec_dists, number = 1)



