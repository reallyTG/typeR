library(envnames)


### Name: get_obj_value
### Title: Return the value of an object referenced by a parameter at a
###   given parent generation
### Aliases: get_obj_value

### ** Examples

# Define functions that are called to show the behaviour of get_obj_value()
h <- function(x) {
  # Get the value of parameter 'x' n levels up, i.e. the value of the parameter
  # that led to the current parameter x in the environment that is n levels up
  # in the function calling chain.
  xval = get_obj_value(x, n=1, silent=FALSE)
  return(xval)
}
g <- function(y) {
  x = 2
  return( h(y) )
}
z = 3
g(z)                     # Returns 3, because the value of x in h() is the value of y
                         # in the calling function g() which is 3.

# Example of calling get_obj_value() from outside a function
x = 3
v = c(1, 2)
get_obj_value(x)         # 3
get_obj_value("x")       # 3
get_obj_value(3)         # 3
get_obj_value(v[1])      # 1




