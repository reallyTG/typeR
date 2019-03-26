library(BGPhazard)


### Name: BePlotDiag
### Title: Diagnosis plots for Pi, u, c and epsilon
### Aliases: BePlotDiag

### ** Examples

## Simulations may be time intensive. Be patient.

## Example 1
#  data(psych)
#  timesP <- psych$time
#  deltaP <- psych$death
#  BEX1 <- BeMRes(timesP, deltaP, iterations = 3000)
#  BePlotDiag(BEX1, variable = "Pi", pos = 2)
#  BePlotDiag(BEX1, variable = "u", pos = 3)

## Example 2
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "control"]
#  deltaG <- gehan$cens[gehan$treat == "control"]
#  BEX2 <- BeMRes(timesG, deltaG, type.c = 2, c.r = rep(50, 22))
#  BePlotDiag(BEX2, variable = "Pi", pos = 5)
#  BePlotDiag(BEX2, variable = "u", pos = 4)



