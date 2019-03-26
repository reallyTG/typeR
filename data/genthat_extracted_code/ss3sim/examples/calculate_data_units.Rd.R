library(ss3sim)


### Name: calculate_data_units
### Title: Given sampling arguments, calculate super set of fleets, years,
###   and data types.
### Aliases: calculate_data_units

### ** Examples

## Should throw error since nothing passed
# calculate_data_units()
## Only one fleet
calculate_data_units(lcomp_params=list(fleets=1, years=c(3,4,6)))
## Add new fleet
calculate_data_units(lcomp_params=list(fleets=1, years=c(3,4,6)),
                     agecomp_params=list(fleets=2, years=5))
## If CAL data called, need other types even if not specified
calculate_data_units(calcomp_params=list(fleets=1, years=c(3,4,6)))



