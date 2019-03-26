library(AER)


### Name: OECDGas
### Title: Gasoline Consumption Data
### Aliases: OECDGas
### Keywords: datasets

### ** Examples

data("OECDGas")

library("lattice")
xyplot(exp(cars) ~ year | country, data = OECDGas, type = "l")
xyplot(exp(gas) ~ year | country, data = OECDGas, type = "l")



