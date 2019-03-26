library(assertr)


### Name: num_row_NAs
### Title: Counts number of NAs in each row
### Aliases: num_row_NAs

### ** Examples


num_row_NAs(mtcars)


library(magrittr)            # for piping operator
library(dplyr)               # for "everything()" function

# using every column from mtcars, make sure there are at most
# 2 NAs in each row. If there are any more than two, error out
mtcars %>%
  assert_rows(num_row_NAs, within_bounds(0,2), everything())
  ## anything here will run




