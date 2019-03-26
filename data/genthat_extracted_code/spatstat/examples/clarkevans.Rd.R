library(spatstat)


### Name: clarkevans
### Title: Clark and Evans Aggregation Index
### Aliases: clarkevans
### Keywords: spatial nonparametric

### ** Examples

  # Example of a clustered pattern
  clarkevans(redwood)

  # Example of an ordered pattern
  clarkevans(cells)

  # Random pattern
  X <- rpoispp(100)
  clarkevans(X)

  # How to specify a clipping region
  clip1 <- owin(c(0.1,0.9),c(0.1,0.9))
  clip2 <- erosion(Window(cells), 0.1)
  clarkevans(cells, clipregion=clip1)
  clarkevans(cells, clipregion=clip2)



