library(plyr)


### Name: maply
### Title: Call function with arguments in array or data frame, returning
###   an array.
### Aliases: maply
### Keywords: manip

### ** Examples

maply(cbind(mean = 1:5, sd = 1:5), rnorm, n = 5)
maply(expand.grid(mean = 1:5, sd = 1:5), rnorm, n = 5)
maply(cbind(1:5, 1:5), rnorm, n = 5)



