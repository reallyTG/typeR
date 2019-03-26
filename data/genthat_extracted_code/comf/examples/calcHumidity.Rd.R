library(comf)


### Name: calcHumidity
### Title: Calculating Various Humidity Related Values
### Aliases: calcHumidity calcDewp calcEnth calcHumx calcMixR calcRH
###   calcSVP calcVP calcVapourpressure
### Keywords: manip

### ** Examples

## Calc single value of absolute humidity
ta <- 25
rh <- 50
calcMixR(ta, rh, 760)

## Calc set of values of absolute humidity
ta <- 25:30
rh <- 50
calcMixR(ta, rh, 760)

## Calculating dew point temperature with single values for ta and rh
calcDewp(25, 50)

## Calculating dew point temperature with a vector of values for ta and a single value for rh
calcDewp(25:29, 50)

## Calc single value of enthalpy
ta <- 25
rh <- 50
calcEnth(ta, rh, 760)

## Calc set of values of enthalpy
ta <- 25:30
rh <- 50
calcEnth(ta, rh, 760)



