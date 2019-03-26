library(spatstat)


### Name: cbind.hyperframe
### Title: Combine Hyperframes by Rows or by Columns
### Aliases: cbind.hyperframe rbind.hyperframe
### Keywords: spatial manip

### ** Examples

  lambda <- runif(5, min=10, max=30)
  X <- lapply(as.list(lambda), function(x) { rpoispp(x) })
  h <- hyperframe(lambda=lambda, X=X)
  g <- hyperframe(id=letters[1:5], Y=rev(X))
  gh <- cbind(h, g)
  hh <- rbind(h, h)



