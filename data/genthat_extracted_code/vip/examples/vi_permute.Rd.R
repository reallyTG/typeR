library(vip)


### Name: vi_permute
### Title: Permutation-Based Variable Importance
### Aliases: vi_permute vi_permute.default

### ** Examples

## Not run: 
##D # Load required packages
##D library(ggplot2)  # for ggtitle() function
##D library(mlbench)  # for ML benchmark data sets
##D library(nnet)     # for fitting neural networks
##D 
##D # Simulate training data
##D set.seed(101)  # for reproducibility
##D trn <- as.data.frame(mlbench.friedman1(500))  # ?mlbench.friedman1
##D 
##D # Inspect data
##D tibble::as.tibble(trn)
##D 
##D # Fit PPR and NN models (hyperparameters were chosen using the caret package
##D # with 5 repeats of 5-fold cross-validation)
##D pp <- ppr(y ~ ., data = trn, nterms = 11)
##D set.seed(0803) # for reproducibility
##D nn <- nnet(y ~ ., data = trn, size = 7, decay = 0.1, linout = TRUE,
##D            maxit = 500)
##D 
##D # Plot VI scores
##D set.seed(2021)  # for reproducibility
##D p1 <- vip(pp, method = "permute", target = "y", metric = "rsquared",
##D           pred_fun = predict) + ggtitle("PPR")
##D p2 <- vip(nn, method = "permute", target = "y", metric = "rsquared",
##D           pred_fun = predict) + ggtitle("NN")
##D grid.arrange(p1, p2, ncol = 2)
##D 
##D # Mean absolute error
##D mae <- function(actual, predicted) {
##D   mean(abs(actual - predicted))
##D }
##D 
##D # Permutation-based VIP with user-defined MAE metric
##D set.seed(1101)  # for reproducibility
##D vip(pp, method = "permute", target = "y", metric = mae,
##D     smaller_is_better = TRUE,
##D     pred_fun = function(object, newdata) predict(object, newdata)  # wrapper
##D ) + ggtitle("PPR")
## End(Not run)



