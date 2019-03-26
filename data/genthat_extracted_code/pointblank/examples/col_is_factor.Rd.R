library(pointblank)


### Name: col_is_factor
### Title: Verify that a column contains R factor objects
### Aliases: col_is_factor

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `factor`
df <-
  data.frame(
    a = c("one", "two"))

# Validate that column `a`
# in the data frame is classed
# as `factor`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_factor(column = a) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



