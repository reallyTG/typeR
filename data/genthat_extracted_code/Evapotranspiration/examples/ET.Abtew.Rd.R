library(Evapotranspiration)


### Name: ET.Abtew
### Title: Abtew Formulation
### Aliases: ET.Abtew
### Keywords: Abtew evapotranspiration actual evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Abtew under the generic function ET
results <- ET.Abtew(data, constants,ts="daily", solar="sunshine hours",
message="yes", save.csv="yes") 



