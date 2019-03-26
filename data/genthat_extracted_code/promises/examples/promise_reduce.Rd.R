library(promises)


### Name: promise_reduce
### Title: Promise-aware version of Reduce
### Aliases: promise_reduce

### ** Examples

# Returns a promise for the sum of e1 + e2, with a 0.5 sec delay
slowly_add <- function(e1, e2) {
  promise(~later::later(~resolve(e1 + e2), delay = 0.5))
}

# Prints 55 after a little over 5 seconds
promise_reduce(1:10, slowly_add, .init = 0) %...>% print()




