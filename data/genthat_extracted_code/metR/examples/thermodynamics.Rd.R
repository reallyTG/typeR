library(metR)


### Name: thermodynamics
### Title: Thermodynamics
### Aliases: thermodynamics IdealGas Adiabat VirtualTemperature MixingRatio
###   ClausiusClapeyron DewPoint

### ** Examples

IdealGas(1013*100, 20 + 273.15)
IdealGas(1013*100, rho = 1.15) - 273.15

(theta <- Adiabat(70000, 20 + 273.15))
Adiabat(70000, theta = theta) - 273.15

# Relative humidity from T and Td
t <- 25 + 273.15
td <- 20 + 273.15
p <- 1000000
(rh <- ClausiusClapeyron(td)/ClausiusClapeyron(t))

# Mixing ratio
ws <- MixingRatio(p, ClausiusClapeyron(t))
w <- ws*rh
DewPoint(p, w) - 273.15    # Recover Td




