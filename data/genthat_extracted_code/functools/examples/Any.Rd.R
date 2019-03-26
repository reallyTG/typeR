library(functools)


### Name: Any
### Title: Test if any items in an object evaluate to TRUE.
### Aliases: Any

### ** Examples

# Examples
data(mtcars)
Any(mtcars, is.numeric) # TRUE
Any(mtcars, is.character) # FALSE
mtcars$am <- factor(mtcars$am)
Any(mtcars, is.numeric) # TRUE
Any(mtcars, is.factor) # TRUE

# Handles NAs and NULLs
Any(list(NA, "3", NULL), is.numeric) # FALSE
Any(list(NA, 3, NULL), is.numeric) # TRUE
Any(list(NA, "3", NULL, 5), is.numeric) #TRUE

# Use na.rm = TRUE to remove NULLS
Any(list(NA, FALSE), Identity) # NA
Any(list(NA, FALSE), Identity, na.rm = TRUE) # FALSE



