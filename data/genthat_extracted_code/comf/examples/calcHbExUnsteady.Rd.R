library(comf)


### Name: calcHbExUnsteady
### Title: Calculates Human Body Exergy Consumption Rate using Unsteady
###   State Method
### Aliases: calcHbExUnsteady
### Keywords: manip

### ** Examples

## Define environmental parameters
ta <- seq(20,25,.1)
tr <- ta
rh <- rep(50, length(ta))
vel <- rep(.1, length(ta))
clo <- rep(.8, length(ta))
met <- rep(1.2, length(ta))
tao <- rep(5, length(ta))
rho <- rep(80, length(ta))
dateTime <- as.POSIXct(seq(0,by=60,length.out=length(ta)), origin="1970-01-01")

## Calculation of human body exergy consumPtion rate
calcHbExUnsteady(ta, tr, rh, vel, clo, met, tao, rho, dateTime = dateTime)$xconsu



