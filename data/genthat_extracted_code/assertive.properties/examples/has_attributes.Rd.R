library(assertive.properties)


### Name: assert_has_all_attributes
### Title: Does the input have the specified attributes?
### Aliases: assert_has_all_attributes assert_has_any_attributes
###   has_attributes

### ** Examples

# has_attributes is vectorized on attrs
has_attributes(sleep, c("class", "names", "row.names", "col.names"))

# You can check for any or all of these attributes to be present.
x <- structure(c(a = 1), b = 2)
assert_has_all_attributes(x, c("names", "b"))
assert_has_any_attributes(x, c("names", "not an attribute"))

# These examples should fail.
assertive.base::dont_stop({
assert_has_all_attributes(x, c("names", "not an attribute"))
})



