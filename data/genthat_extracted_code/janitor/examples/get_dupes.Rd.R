library(janitor)


### Name: get_dupes
### Title: Get rows of a 'data.frame' with identical values for the
###   specified variables.
### Aliases: get_dupes

### ** Examples

get_dupes(mtcars, mpg, hp)
# or called with the magrittr pipe %>% :
mtcars %>% get_dupes(wt)




