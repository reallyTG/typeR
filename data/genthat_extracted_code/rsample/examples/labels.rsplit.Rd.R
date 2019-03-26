library(rsample)


### Name: labels.rsplit
### Title: Find Labels from rsplit Object
### Aliases: labels.rsplit

### ** Examples

cv_splits <- vfold_cv(mtcars)
labels(cv_splits$splits[[1]])



