library(assertr)


### Name: is_uniq
### Title: Returns TRUE where no elements appear more than once
### Aliases: is_uniq

### ** Examples


is_uniq(1:10)

## Not run: 
##D # returns FALSE where a "5" appears
##D is_uniq(c(1:10, 5))
## End(Not run)

library(magrittr)

## Not run: 
##D # this fails 4 times
##D mtcars %>% assert(is_uniq, qsec)
## End(Not run)




