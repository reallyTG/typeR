library(oce)


### Name: as.ctd
### Title: Coerce data into CTD object
### Aliases: as.ctd

### ** Examples

library(oce)
## 1. fake data, with default units
pressure <- 1:50
temperature <- 10 - tanh((pressure - 20) / 5) + 0.02*rnorm(50)
salinity <- 34 + 0.5*tanh((pressure - 20) / 5) + 0.01*rnorm(50)
ctd <- as.ctd(salinity, temperature, pressure)
# Add a new column
fluo <- 5 * exp(-pressure / 20)
ctd <- oceSetData(ctd, name="fluorescence", value=fluo,
                  unit=list(unit=expression(mg/m^3), scale=""))
summary(ctd)

## 2. fake data, with supplied units (which are the defaults, actually)
ctd <- as.ctd(salinity, temperature, pressure,
    units=list(salinity=list(unit=expression(), scale="PSS-78"),
    temperature=list(unit=expression(degree*C), scale="ITS-90"),
    pressure=list(unit=expression(dbar), scale="")))




