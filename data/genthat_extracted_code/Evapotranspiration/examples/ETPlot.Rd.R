library(Evapotranspiration)


### Name: ETPlot
### Title: Plot the daily, monthly and annual aggregations of esimtated
###   evapotranspiration
### Aliases: ETPlot
### Keywords: plot evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Penman under the generic function ET
results <- ET.Penman(data, constants, ts="daily", solar="sunshine hours", 
wind="yes", windfunction_ver = "1948", alpha = 0.08, z0 = 0.001) 


# Read evaporation data
data("E_OBS")
OBS <- ReadOBSEvaporation(E_OBS, data)

# Plot the aggregation of estimated Penman open-water evaporation with observed evaporation
ETPlot(results, type = "Aggregation", OBS, OBSplot = TRUE, Sdate = "2001-05-01", 
Edate = "2004-05-01")



