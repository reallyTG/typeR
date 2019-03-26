library(perry)


### Name: foldControl
### Title: Control object for cross-validation folds
### Aliases: foldControl
### Keywords: utilities

### ** Examples

set.seed(1234)  # set seed for reproducibility
perrySplits(20, foldControl(K = 5))
perrySplits(20, foldControl(K = 5, R = 10))



