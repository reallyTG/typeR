library(pointblank)


### Name: col_is_integer
### Title: Verify that a column contains integer values
### Aliases: col_is_integer

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `integer`
df <-
  data.frame(
    a = as.integer(c(5, 9, 3)))

# Validate that column `a`
# in the data frame is classed
# as `integer`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_integer(
    column = a) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



