library(bioset)


### Name: set_calc_concentrations
### Title: Calculate concentrations for the set using contained
###   calibrators.
### Aliases: set_calc_concentrations

### ** Examples

# generate data
library("tibble")

data <- tibble(
  name = c("CAL1", "CAL2", "CAL3", "A", "B", "C"),
  value = c(1, 5, 10, 2, 4, 6)
)

data

# the known concentration of the calibrators
cals <- c(1, 5, 10)
names(cals) <- c("CAL1", "CAL2", "CAL3")

set_calc_concentrations(
  data = data,
  cal_names = names(cals),
  cal_values = cals
)

# to set column names use notation like in dplyr / tidyverse
# set the name of the column holding the final concentration to "my_protein"
set_calc_concentrations(
  data = data,
  cal_names = names(cals),
  cal_values = cals,
  col_target = my_protein
)

## Not run: 
##D # notice that col_target is given a string
##D # this will fail
##D set_calc_concentrations(
##D   data = data,
##D   cal_names = names(cals),
##D   cal_values =  cals,
##D   col_target = "my_protein"
##D )
## End(Not run)

# simulate data which has to be transformed to get a good fit
cals <- exp(cals)
data$value <- exp(data$value)

# use ln-transformation on values and known concentrations prior to
# fitting a model

data <- set_calc_concentrations(
  data = data,
  cal_names = names(cals),
  cal_values = cals,
  model_func = fit_lnln,
  interpolate_func = interpolate_lnln
)

data

# inspect goodnes of fit
plot_lnln(data$real, data$value)

rm(cals, data)



