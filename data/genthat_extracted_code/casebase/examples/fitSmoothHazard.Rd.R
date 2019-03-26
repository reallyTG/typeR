library(casebase)


### Name: fitSmoothHazard
### Title: Fit smooth-in-time parametric hazard functions.
### Aliases: fitSmoothHazard

### ** Examples

# Simulate censored survival data for two outcome types from exponential distributions
library(data.table)
set.seed(12345)
nobs <- 5000
tlim <- 20

# simulation parameters
b1 <- 200
b2 <- 50

# event type 0-censored, 1-event of interest, 2-competing event
# t observed time/endpoint
# z is a binary covariate
DT <- data.table(z=rbinom(nobs, 1, 0.5))
DT[,`:=` ("t_event" = rweibull(nobs, 1, b1),
          "t_comp" = rweibull(nobs, 1, b2))]
DT[,`:=`("event" = 1 * (t_event < t_comp) + 2 * (t_event >= t_comp),
         "time" = pmin(t_event, t_comp))]
DT[time >= tlim, `:=`("event" = 0, "time" = tlim)]

out_linear <- fitSmoothHazard(event ~ time + z, DT)
out_log <- fitSmoothHazard(event ~ log(time) + z, DT)



