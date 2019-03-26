library(analogue)


### Name: splitSample
### Title: Select samples from along an environmental gradient
### Aliases: splitSample
### Keywords: manip utilities

### ** Examples

data(swappH)

## take a test set of 20 samples along the pH gradient
test1 <- splitSample(swappH, chunk = 10, take = 20)
test1
swappH[test1]

## take a larger sample where some chunks don't have many samples
## do random filling
set.seed(3)
test2 <- splitSample(swappH, chunk = 10, take = 70, fill = "random")
test2
swappH[test2]



