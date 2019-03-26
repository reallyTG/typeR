library(Evapotranspiration)


### Name: ET.McGuinnessBordne
### Title: McGuinness-Bordne Formulation
### Aliases: ET.McGuinnessBordne
### Keywords: McGuinness-Bordne evapotranspiration potential
###   evapotranspiration

### ** Examples

# Use processed existing data set and constants from kent Town, Adelaide
data("processeddata")
data("constants")

# Call ET.McGuinnessBordne under the generic function ET
results <- ET.McGuinnessBordne(data, constants, ts="daily",
message="yes", save.csv="yes")



