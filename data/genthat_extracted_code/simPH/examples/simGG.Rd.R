library(simPH)


### Name: simGG
### Title: A method for plotting simulation objects created by simPH
### Aliases: simGG

### ** Examples

## Not run: 
##D  # Load Carpenter (2002) data
##D data("CarpenterFdaData")
##D 
##D # Load survival package
##D library(survival)
##D 
##D # Run basic model
##D M1 <- coxph(Surv(acttime, censor) ~ lethal*prevgenx,
##D             data = CarpenterFdaData)
##D 
##D # Simulate Marginal Effect of lethal for multiple
##D # values of prevgenx
##D Sim1 <- coxsimInteract(M1, b1 = "lethal", b2 = "prevgenx",
##D                        X2 = seq(2, 115, by = 5), spin = TRUE)
##D 
##D # Plot simulations
##D simGG(Sim1)
## End(Not run)




