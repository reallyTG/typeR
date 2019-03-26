library(assertive.properties)


### Name: assert_is_not_null
### Title: Is the input (not) null?
### Aliases: assert_is_not_null assert_is_null is_not_null is_null

### ** Examples

# Predicate for NULL. 
is_null(NULL)
is_null(c())

# Atomic vectors of length zero are not NULL!
is_null(numeric())
# ... and neither is NA
is_null(NA)

# The opposite check
is_not_null(NULL)
is_not_null(c())
is_not_null(numeric())

# These checks should pass
assert_is_null(NULL)
assert_is_null(c())
assert_is_not_null(NA)

# This should fail
assertive.base::dont_stop(assert_is_null(NaN))



