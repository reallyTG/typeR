library(mmpf)


### Name: makeDesign
### Title: make a uniform, random, or user-specified grid over some columns
###   of a data.frame, and combine it with a grid of points to integrate
###   over.
### Aliases: makeDesign

### ** Examples

data = data.frame(w = seq(0, 1, length.out = 5),
  x = factor(letters[1:5]),
  y = ordered(1:5),
  z = 1:5,
  r = letters[1:5],
  stringsAsFactors = FALSE)
makeDesign(data, "z", c(10, 5), TRUE)




