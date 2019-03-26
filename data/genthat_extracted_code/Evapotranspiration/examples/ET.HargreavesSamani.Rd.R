library(Evapotranspiration)


### Name: ET.HargreavesSamani
### Title: Hargreaves-Samani Formulation
### Aliases: ET.HargreavesSamani
### Keywords: Hargreaves-Samani evapotranspiration reference crop
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.HargreavesSamani under the generic function ET
results <- ET.HargreavesSamani(data, constants, ts="daily", message="yes", save.csv="yes")



