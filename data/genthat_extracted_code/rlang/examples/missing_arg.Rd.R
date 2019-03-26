library(rlang)


### Name: missing_arg
### Title: Generate or handle a missing argument
### Aliases: missing_arg is_missing maybe_missing

### ** Examples

# The missing argument usually arises inside a function when the
# user omits an argument that does not have a default:
fn <- function(x) is_missing(x)
fn()

# Creating a missing argument can also be useful to generate calls
args <- list(1, missing_arg(), 3, missing_arg())
quo(fn(!!! args))

# Other ways to create that object include:
quote(expr = )
expr()

# It is perfectly valid to generate and assign the missing
# argument in a list.
x <- missing_arg()
l <- list(missing_arg())

# Just don't evaluate a symbol that contains the empty argument.
# Evaluating the object `x` that we created above would trigger an
# error.
# x  # Not run

# On the other hand accessing a missing argument contained in a
# list does not trigger an error because subsetting is a function
# call:
l[[1]]
is.null(l[[1]])

# In case you really need to access a symbol that might contain the
# empty argument object, use maybe_missing():
maybe_missing(x)
is.null(maybe_missing(x))
is_missing(maybe_missing(x))


# Note that base::missing() only works on symbols and does not
# support complex expressions. For this reason the following lines
# would throw an error:

#> missing(missing_arg())
#> missing(l[[1]])

# while is_missing() will work as expected:
is_missing(missing_arg())
is_missing(l[[1]])



