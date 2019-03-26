library(perry)


### Name: bootControl
### Title: Control object for bootstrap samples
### Aliases: bootControl
### Keywords: utilities

### ** Examples

set.seed(1234)  # set seed for reproducibility
perrySplits(20, bootControl())
perrySplits(20, bootControl(R = 10))



