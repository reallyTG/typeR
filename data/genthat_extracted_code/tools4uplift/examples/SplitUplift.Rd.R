library(tools4uplift)


### Name: SplitUplift
### Title: Split data with respect to uplift distribution
### Aliases: SplitUplift
### Keywords: sampling

### ** Examples


library(tools4uplift)
data("SimUplift")

split <- SplitUplift(SimUplift, 0.8, c("treat", "y"))
train <- split[[1]]
valid <- split[[2]]




