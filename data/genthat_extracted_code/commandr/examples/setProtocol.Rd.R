library(commandr)


### Name: setProtocol
### Title: Define a Protocol Type
### Aliases: setProtocol

### ** Examples

  setStage("average")
  setProtocol("mean", fun = mean, parent = "average")
  setProtocol("median", fun = median, parent = "average")
  d <- c(1, 2, 4)
  average(d)
  average(d, "median")
  average.median(d)



