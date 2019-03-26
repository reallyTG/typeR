library(pointblank)


### Name: col_exists
### Title: Verify that one or more columns exist
### Aliases: col_exists

### ** Examples

# Validate that column `a` exists in
# the `small_table` CSV file; do this
# by creating an agent, focussing on
# that table, creating a `col_exists()`
# step, and then interrogating the table
agent <-
  create_agent() %>%
  focus_on(
    file_name = 
      system.file(
        "extdata", "small_table.csv",
        package = "pointblank"),
    col_types = "TDicidlc") %>%
  col_exists(column = a) %>%
  interrogate()

# Determine if this column validation
# passed by using `all_passed()`
all_passed(agent)
#> [1] TRUE



