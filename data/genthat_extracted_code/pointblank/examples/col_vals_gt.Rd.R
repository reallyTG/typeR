library(pointblank)


### Name: col_vals_gt
### Title: Verify whether numerical column data are greater than a
###   specified value
### Aliases: col_vals_gt

### ** Examples

# Create a simple data frame
# with a column of numerical values
df <-
  data.frame(
    a = c(5, 7, 6, 5, 8, 7))

# Validate that values in column
# `a` are always greater than 4
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_gt(
    column = a,
    value = 4) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



