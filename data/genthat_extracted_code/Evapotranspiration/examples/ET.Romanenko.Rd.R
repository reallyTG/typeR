library(Evapotranspiration)


### Name: ET.Romanenko
### Title: Romanenko Formulation
### Aliases: ET.Romanenko
### Keywords: Romanenko evapotranspiration potential evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.Romanenko under the generic function ET
results <- ET.Romanenko(data, ts="daily", message="yes", save.csv="yes") 



