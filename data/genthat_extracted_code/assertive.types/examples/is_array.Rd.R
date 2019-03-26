library(assertive.types)


### Name: assert_is_array
### Title: Is the input an array or matrix?
### Aliases: assert_is_array assert_is_matrix is_array is_matrix

### ** Examples

assert_is_array(array())
assert_is_array(matrix())
assert_is_matrix(matrix())
#These examples should fail.
assertive.base::dont_stop(assert_is_matrix(array()))



