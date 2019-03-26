library(Evapotranspiration)


### Name: ET.MortonCRWE
### Title: Morton CRWE Formulation
### Aliases: ET.MortonCRWE
### Keywords: MortonCRWE shallow lake open-water evaporation potential
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from 
# kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.MortonCRWE under the generic function ET
results <- ET.MortonCRWE(data, constants, ts="monthly",
est="potential ET", solar="sunshine hours", Tdew= TRUE, 
alpha = NULL, message="yes", save.csv="yes") 



