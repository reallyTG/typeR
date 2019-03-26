library(TANDEM)


### Name: nested.cv
### Title: Estimating predictive performance via nested cross-validation
### Aliases: nested.cv

### ** Examples

# unpack example data
x = example_data$x
y = example_data$y
upstream = example_data$upstream

# assess the prediction error in a nested cv-loop
# fix the seed to have the same foldids between the two methods
set.seed(1)
cv_tandem = nested.cv(x, y, upstream, method="tandem", alpha=0.5)
set.seed(1)
cv_glmnet = nested.cv(x, y, upstream, method="glmnet", alpha=0.5)
barplot(c(cv_tandem$mse, cv_glmnet$mse), ylab="MSE", names=c("TANDEM", "Classic approach"))



