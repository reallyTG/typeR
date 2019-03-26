library(types)


### Name: removeTypes
### Title: Remove types from a language object
### Aliases: removeTypes remove_types

### ** Examples

# Function arguments can be annotated with types
f <- function(x = 1 ? numeric) {
  x + 1
}

# The types can then be removed if needed
remove_types(f)

# A camelCase function is also available with the same behavior
removeTypes(f)

# They also works on quoted code
remove_types(quote(x + 1 ? numeric))

# Or expressions
remove_types(expression(x + 1 ? numeric))



