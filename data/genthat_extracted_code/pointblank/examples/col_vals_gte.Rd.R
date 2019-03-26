library(pointblank)


### Name: col_vals_gte
### Title: Verify whether numerical column data are greater than or equal
###   to a specified value
### Aliases: col_vals_gte

### ** Examples

# Create a simple data frame
# with a column of numerical
# values
df <-
  data.frame(
    a = c(5, 7, 6, 5, 8, 7))

# Validate that values in column
# `a` are always greater than or
# equal to 5
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_gte(
    column = a,
    value = 5) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



