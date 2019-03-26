library(mobForest)


### Name: bootstrap
### Title: This method computes predicted outcome for each observation in
###   the data frame using the tree model supplied as an input argument.
### Aliases: bootstrap

### ** Examples

## Not run: 
##D formula <- as.formula(medv ~ lstat)
##D # load data
##D data("BostonHousing", package = "mlbench")
##D mobforest_controls <- 
##D   mobforest.control(ntree = 1, mtry = 2, replace = TRUE,
##D                     alpha = 0.05, bonferroni = TRUE, minsplit = 25)
##D 
##D out <- bootstrap(i, data = BostonHousing, main_model = string.formula(formula),
##D                  partition_vars = partition_vars <- c("rad", "crim", "tax"),
##D                  mtry = 2, new_test_data = as.data.frame(matrix(0,0,0)),
##D                  mobforest_controls = mobforest_controls@mob_control, fraction = 1,
##D                  replace = TRUE, model = linearModel, family = "", prob_cutoff = .5)
##D out
## End(Not run)



