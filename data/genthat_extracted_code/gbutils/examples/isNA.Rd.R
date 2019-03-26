library(gbutils)


### Name: isNA
### Title: Check if an object is NA
### Aliases: isNA
### Keywords: NA logic manip

### ** Examples

v <- c(1, NA, 3)
isNA(v[2]) # TRUE

## identical() distinguishes different types of NA:
class(v) # "numeric", not "integer"

identical(v[2], NA)          # FALSE, NA on its own is "logical"
identical(v[2], NA_integer_) # FALSE
identical(v[2], NA_real_)    # TRUE


vi <- c(1L, NA_integer_, 3L)
isNA(vi[2]) # TRUE

class(vi) # "integer"
identical(vi[2], NA_integer_) # TRUE
identical(vi[2], NA_real_)    # FALSE

## is.na(NULL) would give a warning
isNA(NULL) # FALSE

## a length zero object is not NA, so isNA() returns FALSE:
isNA(logical(0)) # FALSE

## is.na() has a different remit and returns a 0-length vector:
is.na(logical(0))  # logical(0)



