library(sealasso)


### Name: summary.sealasso
### Title: Summary method for sealasso objects
### Aliases: summary.sealasso

### ** Examples

  # use the diabetes dataset from "lars" package
  data(diabetes)
  y <- diabetes$y
  # with quadratic terms
  x2 <- cbind(diabetes$x1,diabetes$x2)
  object <- sealasso(x2, y, "sealasso")
  summary(object)



