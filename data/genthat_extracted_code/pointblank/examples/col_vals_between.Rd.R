library(pointblank)


### Name: col_vals_between
### Title: Verify whether column data are between two values
### Aliases: col_vals_between

### ** Examples

# Create a simple data frame
# with a column of numerical
# values
df <-
  data.frame(
    a = c(5.6, 8.2, 6.3, 7.8, 3.4))

# Validate that values in
# column `a` are all between
# 1 and 9
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_between(
    column = a,
    left = 1,
    right = 9) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



