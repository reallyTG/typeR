library(dynatopmodel)


### Name: aggregate_xts
### Title: Resample observation data at a new time interval
### Aliases: aggregate_xts

### ** Examples

# Resample Brompton rainfall and PE data to 15 minute intervals
require(dynatopmodel)
data("brompton")

rain <- aggregate_xts(brompton$rain, dt=15/60)



