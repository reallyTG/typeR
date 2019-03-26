library(Evapotranspiration)


### Name: ET.BrutsaertStrickler
### Title: Brutsaert-Strickler Formulation
### Aliases: ET.BrutsaertStrickler
### Keywords: Brutsaert-Strickler evapotranspiration actual areal
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.BrutsaertStrickler under the generic function ET
results <- ET.BrutsaertStrickler(data, constants, ts="daily", solar="sunshine hours", 
alpha=0.23, message="yes", save.csv="yes")



