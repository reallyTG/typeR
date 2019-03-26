library(tcpl)


### Name: Hill model utilites
### Title: Functions to solve the Hill model
### Aliases: 'Hill model utilites' tcplHillACXX tcplHillConc tcplHillVal

### ** Examples

## The following code gives examples for a Hill model with a top of 50, 
## bottom of 0, AC50 of 1 and Hill coefficient of 1.
## tcplHillVal calculates activity value given a concentration. tcplHillVal
## will return the tp/2 when logc equals ga:
tcplHillVal(logc = 1, tp = 50, ga = 1, gw = 1, bt = 0)

## Here, tcplHillConc returns the concentration where the value equals 20
tcplHillConc(val = 20, tp = 50, ga = 1, gw = 1, bt = 0)

## Note how this differs from tcplHillACXX:
tcplHillACXX(XX = 20, tp = 50, ga = 1, gw = 1, bt = 0)

## tcplHillACXX is based on the top value and allows the user to calculate 
## specifc activity concentrations based on a percentage of the top value

## For example, we can calculate the value for the concentration 0.25, then
## use that value to check the other two functions.

value <- tcplHillVal(logc = 0.25, tp = 50, ga = 1, gw = 1, bt = 0)
c1 <- tcplHillConc(val = value, tp = 50, ga = 1, gw = 1, bt = 0)
c2 <- tcplHillACXX(XX = value/50*100, tp = 50, ga = 1, gw = 1, bt = 0)
all.equal(0.25, c1, c2)

## Notice, the value had to be transformed to a percentage of the top value
## when using tcplHillACXX



