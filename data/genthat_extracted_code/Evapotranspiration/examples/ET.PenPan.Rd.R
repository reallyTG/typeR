library(Evapotranspiration)


### Name: ET.PenPan
### Title: PenPan Formulation
### Aliases: ET.PenPan
### Keywords: PenPan evapotranspiration Class-A pan evaporation potential
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from 
# kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.PenPan under the generic function ET
results <- ET.PenPan(data, constants, ts="daily", 
solar="sunshine hours", alpha=0.23,
est="potential ET", pan_coeff=0.71, overest= FALSE,
message="yes", save.csv="yes")



