library(Evapotranspiration)


### Name: ET.SzilagyiJozsa
### Title: Szilagyi-Jozsa Formulation
### Aliases: ET.SzilagyiJozsa
### Keywords: Szilagyi-Jozsa evapotranspiration actual evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.SzilagyiJozsa under the generic function ET
results <- ET.SzilagyiJozsa(data, constants, ts="daily", 
solar="sunshine hours", wind="yes", windfunction_ver=1948, alpha=0.23, z0=0.2,
message="yes", save.csv="yes")



