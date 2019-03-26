library(BGPhazard)


### Name: BePloth
### Title: Plots for the Hazard and Survival Function Estimates
### Aliases: BePloth

### ** Examples

## Simulations may be time intensive. Be patient.

## Example 1
#  data(psych)
#  timesP <- psych$time
#  deltaP <- psych$death
#  BEX1 <- BeMRes(timesP, deltaP, iterations = 3000)
#  BePloth(BEX1, confint = FALSE)
#  BePloth(BEX1, fun = "both", confint = TRUE)

## Example 2
#  data(gehan)
#  timesG <- gehan$time[gehan$treat == "control"]
#  deltaG <- gehan$cens[gehan$treat == "control"]
#  BEX2 <- BeMRes(timesG, deltaG, type.c = 2, c.r = rep(50, 22))
#  BePloth(BEX2, confint = TRUE, confidence = 0.95)



