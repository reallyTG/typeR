library(pointblank)


### Name: col_vals_equal
### Title: Verify whether numerical column data are equal to a specified
###   value
### Aliases: col_vals_equal

### ** Examples

# Create a simple data frame
# with 2 columns of numerical values
df <-
  data.frame(
    a = c(1, 1, 1, 2, 2, 2),
    b = c(5, 5, 5, 3, 6, 3))

# Validate that values in column
# `b` are equal to 5 when values
# in column `a` are equal to 1 
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_equal(
    column = b,
    value = 5,
    preconditions = a == 1) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



