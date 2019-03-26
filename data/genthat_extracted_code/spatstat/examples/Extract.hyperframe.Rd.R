library(spatstat)


### Name: Extract.hyperframe
### Title: Extract or Replace Subset of Hyperframe
### Aliases: [.hyperframe [<-.hyperframe $.hyperframe $<-.hyperframe
### Keywords: spatial manip

### ** Examples

  h <- hyperframe(X=list(square(1), square(2)), Y=list(sin, cos))
  h
  h[1, ]
  h[1, ,drop=TRUE]
  h[ , 1]
  h[ , 1, drop=TRUE]
  h[1,1]
  h[1,1,drop=TRUE]
  h[1,1,drop=TRUE,strip=FALSE]
  h[1,1] <- list(square(3))
  # extract column
  h$X
  # replace existing column
  h$Y <- list(cells, cells)
  # add new column
  h$Z <- list(cells, cells)



