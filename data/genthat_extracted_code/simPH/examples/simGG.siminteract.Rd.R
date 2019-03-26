library(simPH)


### Name: simGG.siminteract
### Title: Plot simulated linear multiplicative interactions from Cox
###   Proportional Hazards Models
### Aliases: simGG.siminteract

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ lethal*prevgenx,
            data = CarpenterFdaData)

# Simulate Marginal Effect of lethal for multiple values of prevgenx
Sim1 <- coxsimInteract(M1, b1 = "lethal", b2 = "prevgenx",
                     X2 = seq(2, 115, by = 2), nsim = 100)

# Plot quantities of interest
simGG(Sim1)
simGG(Sim1, rug_position = 'jitter')

## Not run: 
##D # Change the order of the covariates to make a more easily
##D # interpretable hazard ratio graph.
##D M2 <- coxph(Surv(acttime, censor) ~ prevgenx*lethal,
##D              data = CarpenterFdaData)
##D 
##D # Simulate Hazard Ratio of lethal for multiple values of prevgenx
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
##D                        X1 = 100, X2 = 1, qi = "Hazard Rate")
##D 
##D # Plot quantities of interest
##D simGG(Sim1, xlab = "\nprevgenx",
##D        ylab = "Marginal Effect of lethal\n")
##D simGG(Sim2, type = 'ribbons', rug_position = 'jitter')
##D simGG(Sim3)
##D simGG(Sim4, to = 150, type = 'lines', legend = FALSE)
## End(Not run)




