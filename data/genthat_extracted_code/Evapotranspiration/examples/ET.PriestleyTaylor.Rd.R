library(Evapotranspiration)


### Name: ET.PriestleyTaylor
### Title: Priestley-Taylor Formulation
### Aliases: ET.PriestleyTaylor
### Keywords: Priestley-Taylor evapotranspiration potential evaporation

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.PriestleyTaylor under the generic function ET
results <- ET.PriestleyTaylor(data, constants, ts="daily", solar="sunshine hours", alpha=0.23,
message="yes", save.csv="yes")



