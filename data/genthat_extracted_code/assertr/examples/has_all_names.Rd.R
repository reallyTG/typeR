library(assertr)


### Name: has_all_names
### Title: Returns TRUE if data.frame or list has specified names
### Aliases: has_all_names

### ** Examples


verify(mtcars, has_all_names("mpg", "wt", "qsec"))

library(magrittr)   # for pipe operator

## Not run: 
##D mtcars %>%
##D   verify(has_all_names("mpgg"))  # fails
## End(Not run)

mpgg <- "something"

mtcars %>%
  verify(exists("mpgg"))   # passes but big mistake

## Not run: 
##D mtcars %>%
##D   verify(has_all_names("mpgg")) # correctly fails
## End(Not run)




