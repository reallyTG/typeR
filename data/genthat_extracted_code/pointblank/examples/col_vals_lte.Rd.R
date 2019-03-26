library(pointblank)


### Name: col_vals_lte
### Title: Verify whether numerical column data are less than or equal to a
###   specified value
### Aliases: col_vals_lte

### ** Examples

# Create a simple data frame
# with a column of numerical
# values
df <-
  data.frame(
    a = c(5, 4, 3, 5, 1, 2),
    b = c(3, 2, 4, 3, 5, 6))

# Validate that the sum of
# values across columns `a`
# and `b` are always less
# than or equal to 10
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_lte(
    column = a + b,
    value = 10) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



