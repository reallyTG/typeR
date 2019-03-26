library(Evapotranspiration)


### Name: ETForcings
### Title: Plot esimtated evapotranspiration with climate variables
### Aliases: ETForcings
### Keywords: plot climate forcing evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Penman under the generic function ET
results <- ET.Penman(data, constants, ts="daily", solar="sunshine hours", 
wind="yes", windfunction_ver = "1948", alpha = 0.08, z0 = 0.001) 

# Plot the estimated Penman open-water evaporation against average temperature
ETForcings(data, results, forcing = "Tmax")



