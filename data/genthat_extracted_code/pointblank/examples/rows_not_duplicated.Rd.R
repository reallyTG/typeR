library(pointblank)


### Name: rows_not_duplicated
### Title: Verify that row data are not duplicated
### Aliases: rows_not_duplicated

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
  rows_not_duplicated(
    cols = a & b) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] FALSE



