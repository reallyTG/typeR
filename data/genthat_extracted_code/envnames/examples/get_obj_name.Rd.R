library(envnames)


### Name: get_obj_name
### Title: Return the name of an object referenced by a parameter at any
###   parent generation
### Aliases: get_obj_name

### ** Examples

# In its default behaviour (eval=FALSE), get_obj_name() returns
# the name of an object in the n-th parent generation.
# This example shows the difference between get_obj_name() and deparse(substitute())
g <- function(y) { return(list(obj_name=get_obj_name(y, n=2), 
                               substitute=deparse(substitute(y, parent.frame(n=2))) )) }
f <- function(x) { g(x) }
z = 3; 
f(z)           # Returns a list where the first element is "z" and the second element is "y"
               # Note that 'z' is the object leading to object 'y' inside function g()
               # if we follow the function calling chain.

# When eval=TRUE, get_obj_name() behaves the same way as deparse(),
# except for the cases noted above.
g <- function(y) {
  print(get_obj_name(y, n=2, eval=TRUE));
  print(deparse(y))
}
f <- function(x) { g(x) }
z = 3; 
f(z)           # Prints "3" twice, once as the output of get_obj_name(),
               # once as the output of deparse()



