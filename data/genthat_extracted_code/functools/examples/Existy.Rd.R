library(functools)


### Name: Existy
### Title: Existy
### Aliases: Existy

### ** Examples

# Some examples
Existy(4) # TRUE
Existy("foo") # TRUE
Existy(NULL) # FALSE
Existy(NA) # FALSE

# Works with lists
Existy(list(4, "foo", NULL, NA)) # TRUE
Existy(list(4, "foo")) # TRUE
Existy(list(NULL, NA)) # TRUE
Existy(list(NULL)) # TRUE
Existy(list(NA)) # FALSE

# Works with applying over lists
lapply(list(4, "foo", NULL, NA), Existy) # TRUE, TRUE, FALSE, FALSE



