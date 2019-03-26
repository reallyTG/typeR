library(emil)


### Name: resample
### Title: Resampling schemes
### Aliases: resample resample_holdout resample_crossvalidation
###   resample_bootstrap

### ** Examples

resample("holdout", 1:50, test_fraction=1/3)
resample("holdout", factor(runif(60) >= .5))
y <- factor(runif(60) >= .5)
cv <- resample("crossvalidation", y)
image(cv, main="Cross-validation scheme")



