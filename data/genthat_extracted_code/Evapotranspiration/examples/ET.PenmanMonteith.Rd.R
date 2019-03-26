library(Evapotranspiration)


### Name: ET.PenmanMonteith
### Title: Penman-Monteith Formulation
### Aliases: ET.PenmanMonteith
### Keywords: Penman-Monteith evapotranspiration Reference crop
###   evapotranspiration FAO-56 ASCE

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.PenmanMonteith under the generic function ET
results <- ET.PenmanMonteith(data, constants, ts="daily", solar="sunshine hours", 
wind="yes", crop = "short", message="yes", save.csv="yes") 



