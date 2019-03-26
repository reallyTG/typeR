library(promises)


### Name: promise_map
### Title: Promise-aware lapply/map
### Aliases: promise_map

### ** Examples

# Waits x seconds, then returns x*10
wait_this_long <- function(x) {
  promise(~later::later(~{
    resolve(x*10)
  }, delay = x))
}

promise_map(list(A=1, B=2, C=3), wait_this_long) %...>%
  print()




