library(ff)


### Name: is.sorted
### Title: Getting and setting 'is.sorted' physical attribute
### Aliases: is.sorted.default is.sorted<-.default
### Keywords: IO data arith

### ** Examples

  x <- 1:12
  is.sorted(x) <- !( is.na(is.unsorted(x)) || is.unsorted(x))
  is.sorted(x)
  x[1] <- 100L
  message("don't forget to maintain once it's no longer TRUE")
  is.sorted(x) <- FALSE
  message("check whether as 'is.sorted' attribute is maintained")
  !is.null(physical(x)$is.sorted)
  message("remove the 'is.sorted' attribute")
  is.sorted(x) <- NULL
  message("NOTE that querying 'is.sorted' still returns FALSE")
  is.sorted(x)



