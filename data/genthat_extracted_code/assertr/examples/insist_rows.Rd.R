library(assertr)


### Name: insist_rows
### Title: Raises error if dynamically created predicate is FALSE for any
###   row after applying row reduction function
### Aliases: insist_rows insist_rows_

### ** Examples


# returns mtcars
insist_rows(mtcars, maha_dist, within_n_mads(30), mpg:carb)

library(magrittr)                    # for piping operator

mtcars %>%
  insist_rows(maha_dist, within_n_mads(10), vs:am)
  # anything here will run

## Not run: 
##D mtcars %>%
##D   insist_rows(maha_dist, within_n_mads(1), everything())
##D   # the assertion is untrue so
##D   # nothing here will run
## End(Not run)




