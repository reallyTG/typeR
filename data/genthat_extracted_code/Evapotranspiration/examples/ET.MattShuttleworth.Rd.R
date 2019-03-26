library(Evapotranspiration)


### Name: ET.MattShuttleworth
### Title: Matt-Shuttleworth Formulation
### Aliases: ET.MattShuttleworth
### Keywords: Matt-Shuttleworth evapotranspiration reference crop
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.MattShuttleworth under the generic function ET
results <- ET.MattShuttleworth(data, constants, ts="daily",
solar="sunshine hours", alpha=0.23, r_s=70, CH=0.12,
message="yes", save.csv="yes")



