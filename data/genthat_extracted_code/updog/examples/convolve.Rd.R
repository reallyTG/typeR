library(updog)


### Name: convolve
### Title: Convolution between two discrete probability mass functions with
###   support on 0:K.
### Aliases: convolve

### ** Examples

x <- c(1 / 6, 2 / 6, 3 / 6)
y <- c(1 / 9, 2 / 9, 6 / 9)
convolve(x, y)
stats::convolve(x, rev(y), type = "o")




