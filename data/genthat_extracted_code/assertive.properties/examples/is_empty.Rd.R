library(assertive.properties)


### Name: assert_has_elements
### Title: Is the input empty/scalar?
### Aliases: assert_has_elements assert_is_empty assert_is_non_empty
###   assert_is_non_scalar assert_is_of_dimension assert_is_of_length
###   assert_is_scalar has_elements is_empty is_non_empty is_non_scalar
###   is_of_dimension is_of_length is_scalar

### ** Examples

# is_of_length returns TRUE if the length of an object
# matches a specified value.
is_of_length(1:5, 5)
assert_is_of_length(1:5, 5)

# has_elements returns TRUE if an object has a specified
# number of elements.  This is usually the same thing.
has_elements(1:5, 5)
assert_has_elements(1:5, 5)

# Data frames and lists behave differently for length
# and number of elements.
d <- data.frame(x = 1:5, y = letters[1:5])
assert_is_of_length(d, 2)
assert_has_elements(d, 10)

l <- list(a = 1:5, b = list(b.a = 1:3, b.b = 1:7))
assert_is_of_length(l, 2)
assert_has_elements(l, 15)

# Functions always have length one, but may have lots of 
# elements.
assert_is_of_length(var, 1)
assert_has_elements(var, 54)

# is_scalar is a shortcut for length one, or one elements.
assert_is_scalar(99)
assert_is_scalar("Multiple words in a single string are scalar.")
assert_is_scalar(NA)

# The two metrics can yield different results!
is_scalar(list(1:5))
is_scalar(list(1:5), "elements")
is_scalar(var)
is_scalar(var, "elements")

# Similarly, is_empty is a shortcut for length zero/zero elements.
assert_is_empty(NULL)
assert_is_empty(numeric())
assert_is_non_empty(1:10)
assert_is_non_empty(NA)

# is_of_dimension tests the lengths of all dimensions.
assert_is_of_dimension(d, c(5, 2))
assert_is_of_dimension(l, NULL)



