library(LncFinder)


### Name: svm_cv
### Title: _k_-fold Cross Validation for SVM
### Aliases: svm_cv

### ** Examples

## Not run: 
##D data(demo_dataset)
##D my_dataset <- demo_dataset
##D 
##D cv_res <- svm_cv(my_dataset, folds.num = 4, seed = 1,
##D                  parallel.core = 2, cost = 3, kernel = "radial", gamma = 0.5)
##D 
##D ### Users can set return.model = TRUE to return the best model.
## End(Not run)



