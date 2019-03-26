library(BGPhazard)


### Name: GaPlotDiag
### Title: Diagnosis plots for lambda, u, c and epsilon
### Aliases: GaPlotDiag

### ** Examples
 
## Simulations may be time intensive. Be patient.

## Example 1
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "6-MP"]
#  deltaG <- gehan$cens[gehan$treat == "6-MP"]
#  GEX1 <- GaMRes(timesG, deltaG, K = 8, iterations = 3000)
#  GaPlotDiag(GEX1, variable = "lambda", pos = 2)
#  GaPlotDiag(GEX1, variable = "u", pos = 5)

## Example 2
#  data(leukemiaFZ)
#  timesFZ <- leukemiaFZ$time
#  deltaFZ <- leukemiaFZ$delta
#  GEX2 <- GaMRes(timesFZ, deltaFZ, type.c = 4)
#  GaPlotDiag(GEX2, variable = "lambda", pos = 2)
#  GaPlotDiag(GEX2, variable = "u", pos = 3)



