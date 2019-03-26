library(VIM)


### Name: prepare
### Title: Transformation and standardization
### Aliases: prepare
### Keywords: manip

### ** Examples


data(sleep, package = "VIM")
x <- sleep[, c("BodyWgt", "BrainWgt")]
prepare(x, scaling = "robust", transformation = "logarithm")




