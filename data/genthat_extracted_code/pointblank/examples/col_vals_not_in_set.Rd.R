library(pointblank)


### Name: col_vals_not_in_set
### Title: Verify that column data are not part of a set of values
### Aliases: col_vals_not_in_set

### ** Examples

# Create a simple data frame with 2 columns: one
# with numerical values and the other with strings
df <-
  data.frame(
    a = c(1, 2, 3, 4),
    b = c("one", "two", "three", "four"),
    stringsAsFactors = FALSE)

# Validate that all numerical
# values in column `a` do not
# belong to a specified numerical
# set, and, create an analogous
# validation check for column `b`
# within a set of string values 
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_not_in_set(
    column = a,
    set = 7:10) %>%
  col_vals_not_in_set(
    column = b,
    set = c("seven", "eight",
            "nine", "ten")) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



