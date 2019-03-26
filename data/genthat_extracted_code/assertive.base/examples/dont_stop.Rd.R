library(assertive.base)


### Name: dont_stop
### Title: Run code without stopping
### Aliases: dont_stop

### ** Examples

dont_stop({
  warning("a warning")
  x <- 1
  stop("an error")
  y <- sqrt(exp(x + 1))
  assert_is_identical_to_true(y)
  y > 0
})



