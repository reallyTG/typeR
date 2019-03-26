library(Evapotranspiration)


### Name: ET.ChapmanAustralian
### Title: Chapman Formulation
### Aliases: ET.ChapmanAustralian
### Keywords: Chapman evapotranspiration potential evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.ChapmanAustralian under the generic function ET
results <- ET.ChapmanAustralian(data, constants, ts="daily", PenPan= TRUE, 
solar="sunshine hours", alpha=0.23, message="yes", save.csv="yes") 



