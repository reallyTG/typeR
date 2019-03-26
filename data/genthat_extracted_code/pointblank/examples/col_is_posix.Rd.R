library(pointblank)


### Name: col_is_posix
### Title: Verify that a column contains POSIXct dates
### Aliases: col_is_posix

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `POSIXct`
df <-
  data.frame(
    a = as.POSIXct(
      strptime(
        "2011-03-27 01:30:00",
        "%Y-%m-%d %H:%M:%S")))

# Validate that column `a` in
# the data frame is classed as
# `POSIXct`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_posix(column = a) %>%
  interrogate()

# Determine if this column
# validation has passed by
# using `all_passed()`
all_passed(agent)
#> [1] TRUE



