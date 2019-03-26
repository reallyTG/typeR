library(semTools)


### Name: EFA-class
### Title: Class For Rotated Results from EFA
### Aliases: EFA-class show,EFA-method summary,EFA-method

### ** Examples


unrotated <- efaUnrotate(HolzingerSwineford1939, nf = 3,
                         varList = paste0("x", 1:9), estimator = "mlr")
summary(unrotated, std = TRUE)
lavInspect(unrotated, "std")

# Rotated by Quartimin
rotated <- oblqRotate(unrotated, method = "quartimin")
summary(rotated)




