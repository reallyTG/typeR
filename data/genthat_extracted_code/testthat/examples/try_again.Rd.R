library(testthat)


### Name: try_again
### Title: Try evaluating an expressing multiple times until it succeeds.
### Aliases: try_again
### Keywords: internal

### ** Examples

third_try <- local({
  i <- 3
  function() {
    i <<- i - 1
    if (i > 0) fail(paste0("i is ", i))
  }
})
try_again(3, third_try())



