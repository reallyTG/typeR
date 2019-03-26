library(simPH)


### Name: coxsimInteract
### Title: Simulate quantities of interest for linear multiplicative
###   interactions from Cox Proportional Hazards models
### Aliases: coxsimInteract

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ lethal*prevgenx,
            data = CarpenterFdaData)

# Simulate Marginal Effect of lethal for multiple
# values of prevgenx
Sim1 <- coxsimInteract(M1, b1 = "lethal", b2 = "prevgenx",
                       X2 = seq(2, 115, by = 5), spin = TRUE)

## Not run: 
##D # Change the order of the covariates to make a more easily
##D # interpretable relative hazard graph.
##D M2 <- coxph(Surv(acttime, censor) ~ prevgenx*lethal +
##D              orphdum, data = CarpenterFdaData)
##D 
##D # Simulate Hazard Ratio of lethal for multiple
##D # values of prevgenx
##D Sim2 <- coxsimInteract(M2, b1 = "prevgenx", b2 = "lethal",
##D                     X1 = seq(2, 115, by = 2),
##D                     X2 = c(0, 1),
##D                     qi = "Hazard Ratio", ci = 0.9)
##D 
##D # Simulate First Difference
##D Sim3 <- coxsimInteract(M2, b1 = "prevgenx", b2 = "lethal",
##D                        X1 = seq(2, 115, by = 2),
##D                        X2 = c(0, 1),
##D                        qi = "First Difference", spin = TRUE)
##D 
##D # Simulate Hazard Rate
##D Sim4 <- coxsimInteract(M2, b1 = "prevgenx", b2 = "lethal",
##D                        X1 = 90, X2 = 1, qi = "Hazard Rate",
##D                        means = TRUE)
## End(Not run)

# Example with a categorical variable
# Download data
data(hmohiv)

# Create category lables
hmohiv$drug <- factor(hmohiv$drug, labels = c('not treated', 'treated'))

M3 <- coxph(Surv(time,censor) ~ drug*age, data = hmohiv)

# Note: Use relevant coefficient name as shown in model summary, e.g.
# 'drugtreated'.
Sim5 <- coxsimInteract(M3, b1 = "drugtreated", b2 = 'age', X2 = 20:54)




