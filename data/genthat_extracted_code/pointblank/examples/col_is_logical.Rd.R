library(pointblank)


### Name: col_is_logical
### Title: Verify that a column contains logical values
### Aliases: col_is_logical

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `logical`
df <-
  data.frame(
    a = c(TRUE, FALSE))

# Validate that column `a` in
# the data frame is classed as
# `logical`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_logical(column = a) %>%
  interrogate()

# Determine if this column
# validation has passed by using
# `all_passed()`
all_passed(agent)
#> [1] TRUE



