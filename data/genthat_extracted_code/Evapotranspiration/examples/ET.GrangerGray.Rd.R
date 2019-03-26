library(Evapotranspiration)


### Name: ET.GrangerGray
### Title: Granger-Gray Formulation
### Aliases: ET.GrangerGray
### Keywords: Granger-Gray evapotranspiration open-water evaporation
###   potential evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.GrangerGray under the generic function ET
results <- ET.GrangerGray(data, constants, ts="daily", 
solar="sunshine hours", windfunction_ver=1948, alpha=0.23, 
message="yes", save.csv="yes")




