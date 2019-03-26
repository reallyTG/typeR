library(emil)


### Name: subresample
### Title: Generate resampling subschemes
### Aliases: subresample

### ** Examples

cv <- resample("holdout", y=1:12, test_fraction=1/4, nfold=3)
inner.cv <- subresample(cv, y=1:12)



