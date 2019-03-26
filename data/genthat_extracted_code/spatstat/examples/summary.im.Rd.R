library(spatstat)


### Name: summary.im
### Title: Summarizing a Pixel Image
### Aliases: summary.im print.summary.im
### Keywords: spatial methods

### ** Examples

  # make an image
  X <- as.im(function(x,y) {x^2}, unit.square())
  # summarize it
  summary(X)
  # save the summary
  s <- summary(X)
  # print it
  print(X)
  s
  # extract stuff
  X$dim
  X$range
  X$integral



