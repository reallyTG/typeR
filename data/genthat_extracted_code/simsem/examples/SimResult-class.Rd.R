library(simsem)


### Name: SimResult-class
### Title: Class '"SimResult"': Simulation Result Object
### Aliases: SimResult-class summary,SimResult-method
###   summaryShort,SimResult-method
### Keywords: classes

### ** Examples

showClass("SimResult")
loading <- matrix(0, 6, 1)
loading[1:6, 1] <- NA
LY <- bind(loading, 0.7)
RPS <- binds(diag(1))
RTE <- binds(diag(6))
CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")

# We make the examples running only 5 replications to save time.
# In reality, more replications are needed.
Output <- sim(5, n=500, CFA.Model)

# Summary the simulation result
summary(Output)

# Short summary of the simulation result
summaryShort(Output)

# Find the fit index cutoff
getCutoff(Output, 0.05)

# Summary of parameter estimates
summaryParam(Output)

# Summary of population parameters
summaryPopulation(Output)



