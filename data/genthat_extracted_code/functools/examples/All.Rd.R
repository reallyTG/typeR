library(functools)


### Name: All
### Title: Test if all items in an object evaluate to TRUE.
### Aliases: All

### ** Examples

# Examples
data(mtcars)
All(mtcars, is.numeric) # TRUE
All(mtcars, is.character) # FALSE
mtcars$am <- factor(mtcars$am)
All(mtcars, is.numeric) # FALSE
All(mtcars, is.factor) # FALSE

# Handles NAs and NULLs
All(list(NA, "3", NULL), is.numeric) # FALSE
All(list(NA, 3, NULL), is.numeric) # FALSE
All(list(NA, "3", NULL, 5), is.numeric) # FALSE

# Use na.rm = TRUE to remove NAs and NULLS
All(list(NA, TRUE), Identity) # NA
All(list(NA, TRUE), Identity, na.rm = TRUE) # TRUE



