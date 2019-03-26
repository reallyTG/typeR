library(rlang)


### Name: as_function
### Title: Convert to function or closure
### Aliases: as_function is_lambda as_closure

### ** Examples

f <- as_function(~ . + 1)
f(10)

# Functions created from a formula have a special class:
is_lambda(f)
is_lambda(as_function(function() "foo"))

# Primitive functions are regularised as closures
as_closure(list)
as_closure("list")

# Operators have `.x` and `.y` as arguments, just like lambda
# functions created with the formula syntax:
as_closure(`+`)
as_closure(`~`)



