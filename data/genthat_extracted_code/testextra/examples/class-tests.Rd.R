library(testextra)


### Name: class-tests
### Title: Enhanced Class Tests
### Aliases: class-tests all_inherit are is_exactly all_are_exactly

### ** Examples

lst <- list(1L, 2, TRUE)

# all_inherit uses `inherits`
all_inherit(lst, 'numeric')
all_inherit(lst, 'integer')
all_inherit(lst, 'ANY')

# are uses `is` so gets different results.
are(lst, "numeric")
are(lst, "integer")
are(lst, "ANY")

# is_exactly the class must match exactly
is_exactly(1L, "integer")
# no inheritance allowed
is_exactly(1L, "numeric")



