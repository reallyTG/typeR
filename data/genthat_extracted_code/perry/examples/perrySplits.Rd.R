library(perry)


### Name: perrySplits
### Title: Data splits for resampling-based prediction error measures
### Aliases: perrySplits
### Keywords: utilities

### ** Examples

set.seed(1234)  # set seed for reproducibility

## data folds for K-fold cross-validation
perrySplits(20, foldControl(K = 5))
perrySplits(20, foldControl(K = 5, R = 10))

## random data splits
perrySplits(20, splitControl(m = 5))
perrySplits(20, splitControl(m = 5, R = 10))

## bootstrap samples
perrySplits(20, bootControl())
perrySplits(20, bootControl(R = 10))



