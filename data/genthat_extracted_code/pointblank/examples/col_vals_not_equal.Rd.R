library(pointblank)


### Name: col_vals_not_equal
### Title: Verify whether numerical column data are not equal to a
###   specified value
### Aliases: col_vals_not_equal

### ** Examples

# Create a simple data frame
# with 2 columns of numerical values
df <-
  data.frame(
    a = c(1, 1, 1, 2, 2, 2),
    b = c(5, 5, 5, 3, 6, 3))

# Validate that values in
# column `b` are not equal to 5
# when values in column `a`
# are equal to 2 
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_not_equal(
    column = b,
    value = 5,
    preconditions = a == 2) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



