library(Evapotranspiration)


### Name: ET.Hamon
### Title: Hamon Formulation
### Aliases: ET.Hamon
### Keywords: Hamon evapotranspiration potential evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Hamon under the generic function ET
results <- ET.Hamon(data, ts="daily", message="yes", save.csv="yes") 



