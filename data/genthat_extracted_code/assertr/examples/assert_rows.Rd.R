library(assertr)


### Name: assert_rows
### Title: Raises error if predicate is FALSE for any row after applying
###   row reduction function
### Aliases: assert_rows assert_rows_

### ** Examples


# returns mtcars
assert_rows(mtcars, num_row_NAs, within_bounds(0,2), mpg:carb)

library(magrittr)                    # for piping operator

mtcars %>%
  assert_rows(rowSums, within_bounds(0,2), vs:am)
  # anything here will run

## Not run: 
##D mtcars %>%
##D   assert_rows(rowSums, within_bounds(0,1), vs:am)
##D   # the assertion is untrue so
##D   # nothing here will run
## End(Not run)




