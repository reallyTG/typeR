library(pointblank)


### Name: interrogate
### Title: Given an agent that is fully loaded with tasks, perform an
###   interrogation
### Aliases: interrogate

### ** Examples

# Create 2 simple data frames
# with 2 columns of numerical
# values in each
df_1 <-
  data.frame(
    a = c(5, 7, 6, 5, 8, 7),
    b = c(7, 1, 0, 0, 0, 3))
    
df_2 <-
  data.frame(
    c = c(8, 8, 8, 6, 1, 3),
    d = c(9, 8, 7, 2, 3, 3))

# Validate that values in column
# `a` from `df_1` are always >= 5,
# and also validate that, in `df_2`,
# values in `c` are always == 8
# when values in `d` are >= 5  
agent <-
  create_agent() %>%
  focus_on(tbl_name = "df_1") %>%
  col_vals_gte(
    column = a,
    value = 5) %>%
  focus_on(tbl_name = "df_2") %>%
  col_vals_equal(
    column = c,
    value = 8,
    preconditions = d >= 5) %>%
  interrogate()
  
# Get a basic summary with
# `get_interrogation_summary()`
get_interrogation_summary(agent)[, 1:7]
#> # A tibble: 2 x 7
#>   tbl_name  db_type assertion_type column value regex all_passed
#>      <chr>    <chr>          <chr>  <chr> <dbl> <chr>      <lgl>
#> 1     df_1 local_df   col_vals_gte      a     5  <NA>       TRUE
#> 2     df_2 local_df col_vals_equal      c     8  <NA>       TRUE



