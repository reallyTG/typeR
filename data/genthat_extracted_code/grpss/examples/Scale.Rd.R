library(grpss)


### Name: Scale
### Title: Scale a matrix-like object
### Aliases: Scale
### Keywords: internal

### ** Examples

x <- matrix(1:18, ncol = 3)
Scale(x)  # standardization
Scale(x, type = "normalize")  # normalization
Scale(x, type = "none")  # do nothing



