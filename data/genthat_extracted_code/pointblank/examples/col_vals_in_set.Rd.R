library(pointblank)


### Name: col_vals_in_set
### Title: Verify whether column data are part of a set of values
### Aliases: col_vals_in_set

### ** Examples

# Create a simple data frame with
# 2 columns: one with numerical
# values and the other with strings
df <-
  data.frame(
    a = c(1, 2, 3, 4),
    b = c("one", "two", "three", "four"),
    stringsAsFactors = FALSE)

# Validate that all numerical values
# in column `a` belong to a numerical
# set, and, create an analogous 
# validation check for column `b` with
# a set of string values 
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_in_set(
    column = a,
    set = 1:4) %>%
  col_vals_in_set(
    column = b,
    set = c("one", "two",
            "three", "four")) %>%
  interrogate()

# Determine if these column
# validations have all passed
# by using `all_passed()`
all_passed(agent)
#> [1] TRUE



