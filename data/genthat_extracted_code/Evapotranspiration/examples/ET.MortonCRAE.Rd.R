library(Evapotranspiration)


### Name: ET.MortonCRAE
### Title: Morton CRAE Formulation
### Aliases: ET.MortonCRAE
### Keywords: MortonCRAE evapotranspiration potential evapotranspiration
###   wet-environment areal evapotranspiration actual areal
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from 
# kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.MortonCRAE under the generic function ET
results <- ET.MortonCRAE(data, constants, ts="monthly", 
est="potential ET", solar="sunshine hours", Tdew= TRUE, 
alpha = NULL, message="yes", save.csv="yes") 



