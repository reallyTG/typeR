library(Evapotranspiration)


### Name: ET
### Title: ET Formulations
### Aliases: ET
### Keywords: evapotranspiration open-water evaporation potential
###   evapotranspiration

### ** Examples

# Use processed existing data set from kent Town, Adelaide
data("processeddata")
data("constants")

# Call generic function ET() - leads to the use of Penman model
results_default <- ET(data, constants)

# Call generic function ET() - leads to the use of Penman-Monteith model
results_crop <- ET(data, constants, crop = "short") 



