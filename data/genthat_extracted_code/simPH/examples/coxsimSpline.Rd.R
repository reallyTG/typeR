library(simPH)


### Name: coxsimSpline
### Title: Simulate quantities of interest for penalized splines from Cox
###   Proportional Hazards models
### Aliases: coxsimSpline

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
# From Keele (2010) replication data
M1 <- coxph(Surv(acttime, censor) ~  prevgenx + lethal + deathrt1 +
           acutediz + hosp01  + pspline(hospdisc, df = 4) +
           pspline(hhosleng, df = 4) + mandiz01 + femdiz01 + peddiz01 +
           orphdum + natreg + vandavg3 + wpnoavg3 +
           pspline(condavg3, df = 4) + pspline(orderent, df = 4) +
           pspline(stafcder, df = 4), data = CarpenterFdaData)

## Not run: 
##D # Simulate Relative Hazards for orderent
##D Sim1 <- coxsimSpline(M1, bspline = "pspline(stafcder, df = 4)",
##D                     bdata = CarpenterFdaData$stafcder,
##D                     qi = "Hazard Ratio",
##D                     Xj = seq(1100, 1700, by = 10),
##D                     Xl = seq(1099, 1699, by = 10), spin = TRUE)
##D 
## End(Not run)
# Simulate Hazard Rates for orderent
Sim2 <- coxsimSpline(M1, bspline = "pspline(orderent, df = 4)",
                       bdata = CarpenterFdaData$orderent,
                       qi = "Hazard Rate",
                       Xj = seq(2, 53, by = 3), nsim = 100)




