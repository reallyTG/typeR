library(assertr)


### Name: verify
### Title: Raises error if expression is FALSE anywhere
### Aliases: verify

### ** Examples


verify(mtcars, drat > 2)     # returns mtcars
## Not run: 
##D verify(mtcars, drat > 3)     # produces error
## End(Not run)


library(magrittr)            # for piping operator

## Not run: 
##D mtcars %>%
##D   verify(drat > 3) %>%
##D   # anything here will not run
## End(Not run)

mtcars %>%
  verify(nrow(mtcars) > 2)
  # anything here will run

alist <- list(a=c(1,2,3), b=c(4,5,6))
verify(alist, length(a) > 2)
verify(alist, length(a) > 2 && length(b) > 2)
verify(alist, a > 0 & b > 2)

## Not run: 
##D alist %>%
##D   verify(alist, length(a) > 5)
##D   # nothing here will run
## End(Not run)





