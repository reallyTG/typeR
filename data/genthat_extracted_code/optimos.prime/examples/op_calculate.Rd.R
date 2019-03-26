library(optimos.prime)


### Name: op_calculate
### Title: This function of Optimos Prime calculates optima and tolerance
###   for a data frame of species and environmental factors
### Aliases: op_calculate
### Keywords: density ecology, optimum, species tolerance,

### ** Examples

# EXAMPLE 1: Loads sample data where species are in relative abundance (percent)
data("environmental_data")
data("species_data")
# EXAMPLE 2: Loads sample data where species are in absolute densities
data("environmental_data_example2")
data("species_data_example2")
# Calculates the autoecological data
optimos.prime::op_calculate(enviromental_df, species_df)



