library(rlang)


### Name: set_attrs
### Title: Add attributes to an object
### Aliases: set_attrs mut_attrs
### Keywords: internal

### ** Examples

set_attrs(letters, names = 1:26, class = "my_chr")

# Splice a list of attributes:
attrs <- list(attr = "attr", names = 1:26, class = "my_chr")
obj <- set_attrs(letters, splice(attrs))
obj

# Zap attributes by passing a single unnamed NULL argument:
set_attrs(obj, NULL)
set_attrs(obj, !!! list(NULL))

# Note that set_attrs() never modifies objects in place:
obj

# For uncopyable types, mut_attrs() lets you modify in place:
env <- env()
mut_attrs(env, foo = "bar")
env



