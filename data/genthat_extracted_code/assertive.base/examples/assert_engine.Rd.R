library(assertive.base)


### Name: assert_engine
### Title: Throws an error if a condition isn't met
### Aliases: assert_engine

### ** Examples

# Basic usage is like do.call; pass a predicate and the arguments to it.
dont_stop(assert_engine(is_true, c(TRUE, FALSE, NA)))

# Customise the error message
dont_stop(
  assert_engine(is_true, c(TRUE, FALSE, NA), msg = "Not everything is true")
)

# Only fail when no values match the predicate's conditions
dont_stop(assert_engine(is_true, logical(3), what = "any"))

# You can use base predicates, but the error message isn't as informative
dont_stop(assert_engine(is.matrix, 1:5))

# Reduce the severity of failure
assert_engine(is_true, c(TRUE, FALSE, NA), severity = "message")




