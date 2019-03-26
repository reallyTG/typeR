library(pointblank)


### Name: get_row_sample_info
### Title: Get information on sample rows from non-passing validations
### Aliases: get_row_sample_info

### ** Examples

# Set a seed
set.seed(23)

# Create a simple data frame with a
# column of numerical values
df <-
  data.frame(
    a = rnorm(
      n = 100,
      mean = 5,
      sd = 2))

# Create 2 simple validation steps
# that test whether values within
# column `a`
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df") %>%
  col_vals_between(
    column = a,
    left = 4,
    right = 6) %>%
  col_vals_lte(
    column = a,
    value = 10) %>%
  interrogate(
    get_problem_rows = TRUE,
    get_first_n = 10)
  
# Find out which validation steps
# contain sample row data
get_row_sample_info(agent)
#>   step   assertion_type n_failed rows_in_sample
#> 1    1 col_vals_between       65             10



