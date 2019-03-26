library(abjutils)


### Name: carefully
### Title: Vectorized, parallel, safe and verbose function factory
### Aliases: carefully

### ** Examples

## Not run: 
##D # Function that takes a string and pastes two other strings
##D # a its beginning and end respectivelly
##D pad <- function(str, b = "", a = "") { paste0(b, str, a) }
##D 
##D # Create wrapped version of pad() that executes over 4 cores,
##D # captures errors, and prints its current iteration with a
##D # probability of 50%
##D new_pad <- carefully(pad, p = 0.5, cores = 4)
##D 
##D # Execute new_pad() with some sample data
##D new_pad(c("asdf", "poiu", "qwer"), b = "0", a = "1")
## End(Not run)




