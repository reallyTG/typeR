library(assertive.properties)


### Name: assert_is_monotonic_increasing
### Title: Is the vector monotonically increasing or decreasing?
### Aliases: assert_is_monotonic_decreasing assert_is_monotonic_increasing
###   is_monotonic is_monotonic_decreasing is_monotonic_increasing

### ** Examples

x <- c(1, 2, 2, 1, 3, 2)
is_monotonic_increasing(x)
is_monotonic_increasing(x, TRUE)
is_monotonic_decreasing(x)
is_monotonic_decreasing(x, TRUE)

# Also works with, e.g., dates & times
is_monotonic_increasing(Sys.time() + x)

# These checks should fail
assertive.base::dont_stop({
  assert_is_monotonic_increasing(x)
  assert_is_monotonic_decreasing(x)
})



