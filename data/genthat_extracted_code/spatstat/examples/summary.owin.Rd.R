library(spatstat)


### Name: summary.owin
### Title: Summary of a Spatial Window
### Aliases: summary.owin
### Keywords: spatial methods

### ** Examples

  summary(owin())  # the unit square

  data(demopat)
  W <- Window(demopat)  # weird polygonal window
  summary(W)           # describes it

  summary(as.mask(W))  # demonstrates current pixel resolution



