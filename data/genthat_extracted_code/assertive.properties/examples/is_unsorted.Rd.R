library(assertive.properties)


### Name: assert_is_unsorted
### Title: Is the input unsorted?
### Aliases: assert_is_unsorted is_unsorted

### ** Examples

assert_is_unsorted(c(1, 3, 2))
assert_is_unsorted(c(1, 1, 2), strictly = TRUE)
# These checks should fail.
assertive.base::dont_stop({
  assert_is_unsorted(c(1, 1, 2))
  assert_is_unsorted(c(2, 1, 0))
})



