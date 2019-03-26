library(Evapotranspiration)


### Name: ET.BlaneyCriddle
### Title: Blaney-Criddle Formulation
### Aliases: ET.BlaneyCriddle
### Keywords: BlaneyCriddle evapotranspiration reference crop
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.BlaneyCriddle under the generic function ET
results <- ET.BlaneyCriddle(data, constants, ts="daily", solar="sunshine hours", 
height= FALSE, message="yes", save.csv="yes")



