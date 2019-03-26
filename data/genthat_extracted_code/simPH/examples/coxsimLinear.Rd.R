library(simPH)


### Name: coxsimLinear
### Title: Simulate quantities of interest for covariates from Cox
###   Proportional Hazards models that are not interacted with time or
###   nonlinearly transformed
### Aliases: coxsimLinear

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ prevgenx + lethal +
            deathrt1 + acutediz + hosp01  + hhosleng +
            mandiz01 + femdiz01 + peddiz01 + orphdum +
            vandavg3 + wpnoavg3 + condavg3 + orderent +
            stafcder, data = CarpenterFdaData)

# Simulate Hazard Ratios
Sim1 <- coxsimLinear(M1, b = "stafcder",
                     Xj = c(1237, 1600),
                     Xl = c(1000, 1000),
                     qi = "Hazard Ratio",
                     spin = TRUE, ci = 0.99)

## Not run: 
##D # Simulate Hazard Rates
##D Sim2 <- coxsimLinear(M1, b = "stafcder",
##D                       Xj = 1237,
##D                       ci = 0.99)
## End(Not run)




