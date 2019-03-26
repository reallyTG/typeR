library(pointblank)


### Name: get_row_sample_data
### Title: Get non-passing sample rows from a validation step
### Aliases: get_row_sample_data

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

# Get row sample data for those rows
# in `df` that did not pass the first
# validation step (`col_vals_between`);
# the leading column `pb_step_` is
# applied to provide context on the
# validation step for which these rows
# failed to pass 
agent %>%
  get_row_sample_data(step = 1)
#> # A tibble: 10 x 2
#>    pb_step_        a
#>       <int>    <dbl>
#>  1        1 6.826534
#>  2        1 8.586776
#>  3        1 6.993210
#>  4        1 7.214981
#>  5        1 7.038411
#>  6        1 8.151559
#>  7        1 2.906929
#>  8        1 2.567247
#>  9        1 3.959643
#> 10        1 3.801374



