library(pegas)


### Name: sw
### Title: Sliding Windows
### Aliases: sw sw.DNAbin
### Keywords: manip

### ** Examples

data(woodmouse)
sw(woodmouse)
sw(woodmouse, 200, 200)
sw(woodmouse, 200, 200, rowAverage = TRUE)

## to get the proportions of G:
foo <- function(x) base.freq(x)["g"]
sw(woodmouse, 200, 200, FUN = foo, rowAverage = TRUE)



