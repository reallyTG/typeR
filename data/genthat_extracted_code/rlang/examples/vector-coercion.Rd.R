library(rlang)


### Name: vector-coercion
### Title: Coerce an object to a base type
### Aliases: vector-coercion as_logical as_integer as_double as_complex
###   as_character as_list
### Keywords: internal

### ** Examples

# Coercing atomic vectors removes attributes with both base R and rlang:
x <- structure(TRUE, class = "foo", bar = "baz")
as.logical(x)

# But coercing lists preserves attributes in base R but not rlang:
l <- structure(list(TRUE), class = "foo", bar = "baz")
as.list(l)
as_list(l)

# Implicit conversions are performed in base R but not rlang:
as.logical(l)
## Not run: 
##D as_logical(l)
## End(Not run)

# Conversion methods are bypassed, making the result of the
# coercion more predictable:
as.list.foo <- function(x) "wrong"
as.list(l)
as_list(l)

# The input is never parsed. E.g. character vectors of numbers are
# not converted to numeric types:
as.integer("33")
## Not run: 
##D as_integer("33")
## End(Not run)


# With base R tools there is no way to convert an environment to a
# list without either triggering method dispatch, or changing the
# original environment. as_list() makes it easy:
x <- structure(as_environment(mtcars[1:2]), class = "foobar")
as.list.foobar <- function(x) abort("dont call me")
as_list(x)



