library(assertive.base)


### Name: Truth
### Title: Is the input TRUE/FALSE/NA?
### Aliases: Truth assert_all_are_false assert_all_are_na
###   assert_all_are_not_false assert_all_are_not_na
###   assert_all_are_not_true assert_all_are_true assert_any_are_false
###   assert_any_are_na assert_any_are_not_false assert_any_are_not_na
###   assert_any_are_not_true assert_any_are_true
###   assert_is_identical_to_false assert_is_identical_to_na
###   assert_is_identical_to_true is_false is_identical_to_false
###   is_identical_to_na is_identical_to_true is_na is_not_false is_not_na
###   is_not_true is_true

### ** Examples

# Checks against logical values using base::identical
assert_is_identical_to_true(TRUE)
assert_is_identical_to_false(FALSE)
assert_is_identical_to_na(NA)

# Other NA types match
assert_is_identical_to_na(NA_complex_)

# NaN is not NA
dont_stop(assert_is_identical_to_na(NaN))

# For a slightly less strict test, you can ignore attributes
assert_is_identical_to_true(c(truth = TRUE), allow_attributes = TRUE)
assert_is_identical_to_false(matrix(FALSE), allow_attributes = TRUE)
assert_is_identical_to_na(structure(NA, class = "nanana"), allow_attributes = TRUE)

# Vectorized predicates (package name explicitly given to prevent
# problems with testthat name clash)
x <- c(TRUE, FALSE, NA)
assertive.base::is_true(x)
assertive.base::is_false(x)
is_na(x)

# ...and their opposites
is_not_true(x)
is_not_false(x)
is_not_na(x)

# Check that at least one element fits the condition
assert_any_are_true(x)
assert_any_are_false(x)
assert_any_are_na(x)

# These checks should fail:
dont_stop({
  assert_is_identical_to_true(c(truth = TRUE))
  assert_is_identical_to_true(1)
  assert_is_identical_to_true(c(TRUE, TRUE))
  assert_is_identical_to_false(matrix(FALSE))
  assert_is_identical_to_na(structure(NA, class = "nanana"))
  assert_all_are_true(x)
  assert_all_are_false(x)
  assert_all_are_na(x)
})

# base::is.na has non-standard behaviour for data.frames and lists.
# is_na and is_not_na coerce to logical vectors (except character input).
# unlist the input or use an apply function.
d <- data.frame(
  x = c(TRUE, FALSE, NA), 
  y = c(0, NA, 2), 
  z = c("a", "NA", NA)
)
is.na(d)
is_na(unlist(d))



