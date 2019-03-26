library(assertive.base)


### Name: get_name_in_parent
### Title: Get the name of a variable in the parent frame
### Aliases: get_name_in_parent

### ** Examples

outside <- 1
f <- function(inside, escape_percent) 
{
  get_name_in_parent(inside, escape_percent)
}
f(outside, TRUE) 
f('10%', TRUE) 
f('10%', FALSE)



