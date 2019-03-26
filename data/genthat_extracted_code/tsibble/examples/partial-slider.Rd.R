library(tsibble)


### Name: partial_slider
### Title: Partially splits the input to a list according to the rolling
###   window size.
### Aliases: partial_slider partial_pslider

### ** Examples

x <- c(1, NA_integer_, 3:5)
slider(x, .size = 3)
partial_slider(x, .size = 3)



