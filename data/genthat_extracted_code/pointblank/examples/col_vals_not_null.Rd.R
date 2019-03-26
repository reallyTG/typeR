library(pointblank)


### Name: col_vals_not_null
### Title: Verify whether all column values are not NULL
### Aliases: col_vals_not_null

### ** Examples

# Create a simple data frame with
# 2 columns: one with numerical
# values and the other with strings
df <-
  data.frame(
    a = c(1, 2, NA, NA),
    b = c(2, 2, 5, 5),
    stringsAsFactors = FALSE)

# Validate that all values in
# column `a` are not NULL when
# values in column `b` are equal
# to 2
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_not_null(
    column = a,
    preconditions = b == 2) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



