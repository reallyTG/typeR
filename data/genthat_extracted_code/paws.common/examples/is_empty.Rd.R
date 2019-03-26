library(paws.common)


### Name: is_empty
### Title: Check whether an object is empty
### Aliases: is_empty

### ** Examples

is_empty(NA) # TRUE
is_empty("") # TRUE
is_empty(list()) # TRUE
is_empty(list(list())) # TRUE

is_empty(1) # FALSE
is_empty(list(1)) # FALSE
is_empty(list(list(1))) # FALSE




