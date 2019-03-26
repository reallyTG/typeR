library(pointblank)


### Name: col_is_numeric
### Title: Verify that a column contains numeric values
### Aliases: col_is_numeric

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `numeric`
df <-
  data.frame(
    a = c(5.1, 2.9),
    stringsAsFactors = FALSE)

# Validate that column `a`
# in the data frame is classed
# as `numeric`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_numeric(
    column = a) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



