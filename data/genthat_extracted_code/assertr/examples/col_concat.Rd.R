library(assertr)


### Name: col_concat
### Title: Concatenate all columns of each row in data frame into a string
### Aliases: col_concat

### ** Examples


col_concat(mtcars)

library(magrittr)            # for piping operator

# you can use "assert_rows", "is_uniq", and this function to
# check if joint duplicates (across different columns) appear
# in a data frame
## Not run: 
##D mtcars %>%
##D   assert_rows(col_concat, is_uniq, mpg, hp)
##D   # fails because the first two rows are jointly duplicates
##D   # on these two columns
## End(Not run)

mtcars %>%
  assert_rows(col_concat, is_uniq, mpg, hp, wt) # ok




