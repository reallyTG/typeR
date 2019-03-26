library(Evapotranspiration)


### Name: ETComparison
### Title: Compare esimtated evapotranspiration among multiple sets of
###   result
### Aliases: ETComparison
### Keywords: plot climate forcing evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Penman under the generic function ET
results_Penman <- ET.Penman(data, constants, ts="daily", solar="sunshine hours", 
wind="yes", windfunction_ver = "1948", alpha = 0.08, z0 = 0.001) 

# Call ET.PenmanMonteith under the generic function ET
results_PenmanMonteith <- ET.PenmanMonteith(data, constants, ts="daily", solar="sunshine hours", 
wind="yes", crop = "short") 

# Plot the estimated Penman open-water evaporation against average temperature
ETComparison(results_Penman, results_PenmanMonteith, type = "Monthly", ylim=c(0,400),
labs=c("Penman","PenmanMonteith"))



