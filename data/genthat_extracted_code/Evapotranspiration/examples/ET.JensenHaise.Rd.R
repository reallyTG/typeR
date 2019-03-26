library(Evapotranspiration)


### Name: ET.JensenHaise
### Title: Jensen-Haise Formulation
### Aliases: ET.JensenHaise
### Keywords: Jensen-Haise evapotranspiration potential evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.JensenHaise under the generic function ET
results <- ET.JensenHaise(data, constants, ts="daily", solar="sunshine hours",
message="yes",save.csv="yes")



