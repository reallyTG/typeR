library(LEGIT)


### Name: longitudinal_folds
### Title: Longitudinal folds
### Aliases: longitudinal_folds

### ** Examples

train = example_2way(500, 1, seed=777)
# Assuming it's longitudinal with 4 timepoints, even though it's not
id = factor(rep(1:125,each=4))
fit_cv = LEGIT_cv(train$data, train$G, train$E, y ~ G*E, folds=longitudinal_folds(1,10, id))



