library(ENiRG)


### Name: apis.hsm
### Title: List with values returned from 'enirg.predict'.
### Aliases: apis.hsm
### Keywords: datasets

### ** Examples

data(apis.hsm)

require(raster)

plot(apis.hsm$African_predicted_hsm)
contour(apis.hsm$African_predicted_hsm, add = TRUE)



