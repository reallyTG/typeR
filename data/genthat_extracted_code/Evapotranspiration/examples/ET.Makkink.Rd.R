library(Evapotranspiration)


### Name: ET.Makkink
### Title: Makkink Formulation
### Aliases: ET.Makkink
### Keywords: Makkink reference crop evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Makkink under the generic function ET
results <- ET.Makkink(data, constants, ts="daily", solar="sunshine hours",
message="yes", save.csv="yes")




