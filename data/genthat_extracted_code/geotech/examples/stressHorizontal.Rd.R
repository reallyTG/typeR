library(geotech)


### Name: stressHorizontal
### Title: Horizontal Stress Calculations
### Aliases: stressHorizontal sigmaX sigmaX.profile

### ** Examples


##  Example code for Horizontal Stress at a point
sigmaX(gamma = c(108, 116), depth = c(15, 40), zout = 18,
       K = c(0.34, 0.32), zw = 15, metric = FALSE, upper = TRUE)

##  Example code for Horizontal Stress Profile
sigmaX.profile(gamma = c(108, 116), depth = c(15, 40),
               K = c(0.34, 0.32), zw = 15, metric = FALSE)



