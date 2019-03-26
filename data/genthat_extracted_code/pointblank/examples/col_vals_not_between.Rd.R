library(pointblank)


### Name: col_vals_not_between
### Title: Verify that column data are not between two values
### Aliases: col_vals_not_between

### ** Examples

# Create a simple data frame
# with a column a numerical values
df <-
  data.frame(
    a = c(5.6, 8.2, 6.3, 7.8, 3.4))

# Validate that none of the values 
# in column `a` are between 9 and 10,
# or, between 0 and 2
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_not_between(
    column = a,
    left = 9,
    right = 10) %>%
  col_vals_not_between(
    column = a,
    left = 0,
    right = 2) %>%
  interrogate()

# Determine if these column
# validations have all passed by
# using `all_passed()`
all_passed(agent)
#> [1] TRUE



