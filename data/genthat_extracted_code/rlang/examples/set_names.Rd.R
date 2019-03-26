library(rlang)


### Name: set_names
### Title: Set names of a vector
### Aliases: set_names

### ** Examples

set_names(1:4, c("a", "b", "c", "d"))
set_names(1:4, letters[1:4])
set_names(1:4, "a", "b", "c", "d")

# If the second argument is ommitted a vector is named with itself
set_names(letters[1:5])

# Alternatively you can supply a function
set_names(1:10, ~ letters[seq_along(.)])
set_names(head(mtcars), toupper)

# `...` is passed to the function:
set_names(head(mtcars), paste0, "_foo")



