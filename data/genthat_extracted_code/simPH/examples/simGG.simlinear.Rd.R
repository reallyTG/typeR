library(simPH)


### Name: simGG.simlinear
### Title: Plot simulated linear, non-time interacted quantities of
###   interest from Cox Proportional Hazards Models
### Aliases: simGG.simlinear

### ** Examples


# Load survival package
library(survival)
# Load Carpenter (2002) data
data("CarpenterFdaData")

# Estimate basic model
M1 <- coxph(Surv(acttime, censor) ~ prevgenx + lethal +
            deathrt1 + acutediz + hosp01  + hhosleng +
            mandiz01 + femdiz01 + peddiz01 + orphdum +
            vandavg3 + wpnoavg3 + condavg3 + orderent +
            stafcder, data = CarpenterFdaData)

# Simulate and plot Hazard Ratios for stafcder variable
Sim1 <- coxsimLinear(M1, b = "stafcder",
                     Xj = c(1237, 1600),
                     Xl = c(1000, 1000),
                     qi = "Hazard Ratio",
                     spin = TRUE, ci = 0.99)
simGG(Sim1, method = 'lm', rug_position = 'jitter')
simGG(Sim1, rug_position = 'jitter')

## Not run: 
##D # Simulate and plot Hazard Rate for stafcder variable
##D Sim2 <- coxsimLinear(M1, b = "stafcder", nsim = 100,
##D                       qi = "Hazard Rate",
##D                       Xj = c(1237, 1600))
##D simGG(Sim2, type = 'points')
##D simGG(Sim2, type = 'lines')
## End(Not run)




