library(simPH)


### Name: coxsimPoly
### Title: Simulate quantities of interest for a range of values for a
###   polynomial nonlinear effect from Cox Proportional Hazards models
### Aliases: coxsimPoly

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ prevgenx + lethal + deathrt1 +
            acutediz + hosp01  + hhosleng + mandiz01 + femdiz01 +
            peddiz01 + orphdum + natreg + I(natreg^2) +
            I(natreg^3) + vandavg3 + wpnoavg3 +
            condavg3 + orderent + stafcder, data = CarpenterFdaData)

# Simulate simpoly First Difference
Sim1 <- coxsimPoly(M1, b = "natreg", qi = "First Difference",
                pow = 3, Xj = seq(1, 150, by = 5), nsim = 100)

## Not run: 
##D # Simulate simpoly Hazard Ratio with spin probibility interval
##D Sim2 <- coxsimPoly(M1, b = "natreg", qi = "Hazard Ratio",
##D               pow = 3, Xj = seq(1, 150, by = 5), spin = TRUE)
## End(Not run)




