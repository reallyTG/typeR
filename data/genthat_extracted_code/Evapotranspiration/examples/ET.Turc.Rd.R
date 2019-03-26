library(Evapotranspiration)


### Name: ET.Turc
### Title: Turc Formulation
### Aliases: ET.Turc
### Keywords: Turc evapotranspiration reference crop evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Turc under the generic function ET
results <- ET.Turc(data, constants, ts="daily", solar="sunshine hours", humid= FALSE,
message="yes", save.csv="yes")



