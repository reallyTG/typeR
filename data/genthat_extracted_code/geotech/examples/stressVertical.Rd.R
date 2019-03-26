library(geotech)


### Name: stressVertical
### Title: Vertical Stress Calculations
### Aliases: stressVertical sigmaZ sigmaZ.profile

### ** Examples


## Example code for Vertical Stress at a Point
sigmaZ(gamma = c(108, 116), depth = c(15, 40), zout = 18, zw = 15, metric = FALSE)

##  Example code for Vertical Stress Profile
sigmaZ.profile(gamma = c(108, 116), depth = c(15, 40), zw = 15, metric = FALSE)



