library(pointblank)


### Name: col_vals_regex
### Title: Verify whether string column data corresponds to a regex
###   matching expression
### Aliases: col_vals_regex

### ** Examples

# Create a simple data frame with a column
# containing strings
df <-
  data.frame(
    a = c("s_0131", "s_0231",
          "s_1389", "s_2300"),
    stringsAsFactors = FALSE)

# Validate that all string values in
# column `a` match a regex statement
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_regex(
    column = a,
    regex = "^s_[0-9]{4}$") %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



