library(Evapotranspiration)


### Name: ET.Linacre
### Title: Linacre Formulation
### Aliases: ET.Linacre
### Keywords: Linacre evapotranspiration actual evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Linacre under the generic function ET
results <- ET.Linacre(data, constants, ts="daily",
message="yes", save.csv="yes") 



