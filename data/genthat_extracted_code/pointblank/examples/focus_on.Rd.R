library(pointblank)


### Name: focus_on
### Title: Place certain access details more to the fore
### Aliases: focus_on

### ** Examples

# Create a simple data frame with a column
# of numerical values
df <-
  data.frame(
    a = c(5, 4, 3, 5, 1, 2))

# Validate that values in column `a` are
# always less than 6; this requires the
# use of `create_agent()` (to begin the 
# validation process) and `focus_on()`
# to point to the table that will undergo
# validation in subsequent steps
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_lt(
    column = a,
    value = 6) %>%
  interrogate()

# Determine if this column validation has
# passed by using `all_passed()`
all_passed(agent)
#> [1] TRUE



