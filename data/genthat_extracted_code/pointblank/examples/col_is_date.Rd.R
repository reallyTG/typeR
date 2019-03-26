library(pointblank)


### Name: col_is_date
### Title: Verify that a column contains R Date objects
### Aliases: col_is_date

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `Date`
df <-
  data.frame(
    a = as.Date("2017-08-15"))

# Validate that column `a`
# in the data frame is classed
# as `Date`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_date(
    column = a) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



