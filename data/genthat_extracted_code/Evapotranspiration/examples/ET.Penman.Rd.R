library(Evapotranspiration)


### Name: ET.Penman
### Title: Penman Formulation
### Aliases: ET.Penman
### Keywords: Penman evapotranspiration open-water evaporation potential
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from 
# kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Penman under the generic function ET
results <- ET.Penman(data, constants, ts="daily", 
solar="sunshine hours", wind="yes", 
windfunction_ver = "1948", alpha = 0.08, z0 = 0.001, 
message="yes", save.csv="yes") 



