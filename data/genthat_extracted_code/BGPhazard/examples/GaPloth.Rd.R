library(BGPhazard)


### Name: GaPloth
### Title: Plots for the Hazard and Survival Function Estimates
### Aliases: GaPloth

### ** Examples

## Simulations may be time intensive. Be patient.

## Example 1
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "6-MP"]
#  deltaG <- gehan$cens[gehan$treat == "6-MP"]
#  GEX1 <- GaMRes(timesG, deltaG, K = 8, iterations = 3000)
#  GaPloth(GEX1, confint = FALSE)
#  GaPloth(GEX1, fun = "both", confint = TRUE)

## Example 2
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
#  GaPloth(GEX2, fun = "both", confint = TRUE)



