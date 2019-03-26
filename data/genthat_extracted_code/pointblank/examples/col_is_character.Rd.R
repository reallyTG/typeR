library(pointblank)


### Name: col_is_character
### Title: Verify that a column contains character/string data
### Aliases: col_is_character

### ** Examples

# Create a simple data frame
# with a column containing data
# classed as `character`
df <-
  data.frame(
    a = c("one", "two"),
    stringsAsFactors = FALSE)

# Validate that column `a`
# in the data frame is classed
# as `character`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_is_character(
    column = a) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



