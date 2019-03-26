library(bfast)


### Name: som
### Title: Two 16-day NDVI time series from the south of Somalia
### Aliases: som
### Keywords: datasets

### ** Examples

## first define the data as a regular time series (i.e. ts object)
library(zoo)
NDVI <- as.ts(zoo(som$NDVI.b,som$Time))
plot(NDVI)




