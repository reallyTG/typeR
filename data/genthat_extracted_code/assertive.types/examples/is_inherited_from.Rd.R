library(assertive.types)


### Name: assert_is_inherited_from
### Title: Does the object inherit from some class?
### Aliases: assert_is_inherited_from is_inherited_from

### ** Examples

x <- structure(1:5, class = c("foo", "bar"))
assert_is_inherited_from(x, c("foo", "baz"))
assertive.base::dont_stop(assert_is_inherited_from(x, c("Foo", "baz")))



