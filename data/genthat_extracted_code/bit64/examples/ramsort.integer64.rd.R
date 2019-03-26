library(bit64)


### Name: ramsort.integer64
### Title: Low-level intger64 methods for in-RAM sorting and ordering
### Aliases: ramsort.integer64 shellsort.integer64 quicksort.integer64
###   mergesort.integer64 radixsort.integer64 ramorder.integer64
###   shellorder.integer64 quickorder.integer64 mergeorder.integer64
###   radixorder.integer64 ramsortorder.integer64 shellsortorder.integer64
###   quicksortorder.integer64 mergesortorder.integer64
###   radixsortorder.integer64
### Keywords: programming manip

### ** Examples

  x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
  x
  message("ramsort example")
  s <- clone(x)
  ramsort(s)
  message("s has been changed in-place - whether or not ramsort uses an in-place algorithm")
  s
  message("ramorder example")
  s <- clone(x)
  o <- seq_along(s)
  ramorder(s, o)
  message("o has been changed in-place - s remains unchanged")
  s
  o
  s[o]
  message("ramsortorder example")
  o <- seq_along(s)
  ramsortorder(s, o)
  message("s and o have both been changed in-place - this is much faster")
  s
  o



