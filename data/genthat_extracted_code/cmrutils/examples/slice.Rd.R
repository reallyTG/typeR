library(cmrutils)


### Name: slice
### Title: Helper Routine
### Aliases: slice
### Keywords: utilities

### ** Examples

  x <- 1:10
  slice(x, 1, 1)

  x <- matrix(1:4, 2, 2)
  rownames(x) <- c("Row 1", "Row 2")
  colnames(x) <- c("Col 1", "Col 2")
  x
  slice(x, 1, 1)
  slice(x, 1, 2)
  slice(x, 2, 1)
  slice(x, 2, 2)

  x <- array(1:24, dim = c(2, 3, 4))
  dimnames(x) <- list(letters[1:2], letters[3:5], letters[6:9])
  x
  slice(x, 1, 1) 
  slice(x, 2, 1)
  slice(x, 3, 1)



