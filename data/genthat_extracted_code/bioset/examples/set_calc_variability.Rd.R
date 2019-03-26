library(bioset)


### Name: set_calc_variability
### Title: Calculate parameters of variability for a given set of values.
### Aliases: set_calc_variability

### ** Examples

# generate data
library("tibble")

data <- tibble(
  names = c("A", "B", "C", "A", "B", "C"),
  value = c(19, 59, 22, 18, 63, 28),
  conc = c(1.9, 5.9, 2.2, 1.8, 6.3, 2.8)
)

data

set_calc_variability(
  data = data,
  ids = names,
  value,
  conc
)

# to set column names use notation like in dplyr / tidyverse
## Not run: 
##D # notice how strings are given as column names
##D set_calc_variability(
##D   data = data,
##D   ids = "names",
##D   "value",
##D   "conc"
##D )
## End(Not run)

rm(cals)




