library(Evapotranspiration)


### Name: ReadOBSEvaporations
### Title: Read Raw Data of Observed Evaporation from file
### Aliases: ReadOBSEvaporation
### Keywords: Reading evapotranspiration observation

### ** Examples

# Get the time period from "data"
# Use processed existing data set from kent Town, Adelaide
data("processeddata")
data("constants")

# Reading obsevations of evaporation within specified time period
data("E_OBS")
OBS <- ReadOBSEvaporation(E_OBS, data)



