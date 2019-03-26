library(pointblank)


### Name: col_vals_lt
### Title: Verify whether numerical column data are less than a specified
###   value
### Aliases: col_vals_lt

### ** Examples

# Create a simple data frame
# with a column of numerical
# values
df <-
  data.frame(
    a = c(5, 4, 3, 5, 1, 2))

# Validate that values in
# column `a` are always less
# than 6
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_lt(
    column = a,
    value = 6) %>%
  interrogate()

# Determine if this column 
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



