library(simPH)


### Name: simGG.simspline
### Title: Plot simulated penalised spline hazards from Cox Proportional
###   Hazards Models
### Aliases: simGG.simspline

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
# From Keele (2010) replication data
M1 <- coxph(Surv(acttime, censor) ~  prevgenx + lethal + deathrt1 +
                acutediz + hosp01  + pspline(hospdisc, df = 4) +
                pspline(hhosleng, df = 4) + mandiz01 + femdiz01 +
                peddiz01 + orphdum + natreg + vandavg3 + wpnoavg3 +
                pspline(condavg3, df = 4) + pspline(orderent, df = 4) +
                pspline(stafcder, df = 4), data = CarpenterFdaData)

# Simulate Relative Hazards for orderent
Sim1 <- coxsimSpline(M1, bspline = "pspline(stafcder, df = 4)",
                    bdata = CarpenterFdaData$stafcder,
                    qi = "Hazard Ratio",
                    Xj = seq(1100, 1700, by = 10),
                    Xl = seq(1099, 1699, by = 10), spin = TRUE, nsim = 100)

# Plot relative hazard
simGG(Sim1, alpha = 0.5)

## Not run: 
##D # Simulate Hazard Rate for orderent
##D Sim2 <- coxsimSpline(M1, bspline = "pspline(orderent, df = 4)",
##D                     bdata = CarpenterFdaData$orderent,
##D                     qi = "Hazard Rate",
##D                     Xj = seq(1, 30, by = 2), ci = 0.9, nsim = 10)
##D 
##D # Create a time grid plot
##D # Find all points in time where baseline hazard was found
##D unique(Sim2$sims$Time)
##D 
##D # Round time values so they can be exactly matched with FacetTime
##D Sim2$sims$Time <- round(Sim2$sims$Time, digits = 2)
##D 
##D # Create plot
##D simGG(Sim2, FacetTime = c(6.21, 25.68, 100.64, 202.36),
##D        type = 'ribbons', alpha = 0.5)
##D 
##D # Simulated Fitted Values of stafcder
##D Sim3 <- coxsimSpline(M1, bspline = "pspline(stafcder, df = 4)",
##D                     bdata = CarpenterFdaData$stafcder,
##D                     qi = "Hazard Ratio",
##D                     Xj = seq(1100, 1700, by = 10),
##D                     Xl = seq(1099, 1699, by = 10), ci = 0.90)
##D 
##D # Plot simulated Hazard Ratios
##D simGG(Sim3, xlab = "\nFDA Drug Review Staff", type = 'lines', alpha = 0.2)
##D simGG(Sim3, xlab = "\nFDA Drug Review Staff", alpha = 0.2,
##D       SmoothSpline = TRUE, type = 'points')
## End(Not run)




