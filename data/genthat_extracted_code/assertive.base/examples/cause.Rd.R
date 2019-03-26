library(assertive.base)


### Name: cause
### Title: Get or set the '"cause"' attribute
### Aliases: cause cause<-

### ** Examples

# Scalar case
yn <- is_identical_to_true(FALSE)
cause(yn)

# Vector case
yn <- is_true(c(TRUE, FALSE, NA))
cause(yn)



