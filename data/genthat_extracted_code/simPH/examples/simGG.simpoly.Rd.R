library(simPH)


### Name: simGG.simpoly
### Title: Plot simulated polynomial quantities of interest from Cox
###   Proportional Hazards Models
### Aliases: simGG.simpoly

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ prevgenx + lethal +
       deathrt1 + acutediz + hosp01  + hhosleng + mandiz01 +
       femdiz01 + peddiz01 + orphdum + natreg +
       I(natreg^2) + I(natreg^3) + vandavg3 + wpnoavg3 +
       condavg3 + orderent + stafcder, data = CarpenterFdaData)

# Simulate simpoly First Difference
Sim1 <- coxsimPoly(M1, b = "natreg", qi = "First Difference",
           pow = 3, Xj = seq(1, 150, by = 5), nsim = 100)

# Plot simulations
simGG(Sim1, rug_position = 'jitter')

## Not run: 
##D # Simulate simpoly Hazard Ratio with spin probibility interval
##D Sim2 <- coxsimPoly(M1, b = "natreg", qi = "Hazard Ratio",
##D           pow = 3, Xj = seq(1, 150, by = 5), spin = TRUE,
##D           nsim = 100)
##D 
##D # Plot simulations
##D simGG(Sim2, type = 'ribbons', rug_position = 'jitter')
##D 
##D Sim3 <- coxsimPoly(M1, b = "natreg", qi = "Hazard Rate",
##D            pow = 3, Xj = c(1, 150), nsim = 100)
##D 
##D # Plot simulations
##D simGG(Sim3, type = 'lines')
## End(Not run)




