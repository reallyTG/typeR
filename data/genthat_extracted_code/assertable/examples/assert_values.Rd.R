library(assertable)


### Name: assert_values
### Title: Assert that a data.frame's columns are non-NA/infinite, or are
###   greater, less than, equal/not-equal, or contain specified values.
### Aliases: assert_values

### ** Examples

assert_values(CO2, colnames="uptake", test="gt", 0) # Are all values greater than 0?
assert_values(CO2, colnames="conc", test="lte", 1000) # Are all values less than/equal to 1000?
## Not run: 
##D  assert_values(CO2, colnames="uptake", test="lt", 40) # Are all values less than 40?
##D  # Fails: not all values < 40.
## End(Not run)
assert_values(CO2, colnames="Treatment", test="in", test_val = c("nonchilled","chilled"))
CO2_mult <- CO2
CO2_mult$new_uptake <- CO2_mult$uptake * 2
assert_values(CO2, colnames="uptake", test="equal", CO2_mult$new_uptake/2)
## Not run: 
##D  assert_values(CO2, colnames="uptake", test="gt", CO2_mult$new_uptake/2, display_rows=F)
##D  # Fails: uptake !> new_uptake/2
## End(Not run)



