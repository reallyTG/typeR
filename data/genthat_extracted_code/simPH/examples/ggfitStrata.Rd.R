library(simPH)


### Name: ggfitStrata
### Title: Graph fitted stratified survival curves from Cox Proportional
###   Hazards models
### Aliases: ggfitStrata

### ** Examples

# Load packages
library(survival)
library(simPH)

# Subset data
bladder1 <- bladder[bladder$enum < 5, ]

# Estimate coxph model (note that this model is for code illustration only)
M1 <- coxph(Surv(stop, event) ~ (rx + size + number) + strata(enum) +
                cluster(id), bladder1)

# Find predicted values
M1Fit <- survfit(M1)

# Plot strata in a grid
ggfitStrata(M1Fit, byStrata = TRUE)

# Plot all in one
ggfitStrata(M1Fit, byStrata = FALSE)




