library(itertools)


### Name: is.iterator
### Title: Utilities for writing iterators
### Aliases: is.iterator end_iteration iteration_has_ended new_iterator
### Keywords: utilities

### ** Examples

# Manually iterate using the iteration_has_ended function to help
it <- iter(1:3)
tryCatch({
  stopifnot(is.iterator(it))
  repeat {
    print(nextElem(it))
  }
},
error=function(e) {
  if (!iteration_has_ended(e)) {
    stop(e)
  }
})



