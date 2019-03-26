library(simsem)


### Name: summaryFit
### Title: Provide summary of model fit across replications
### Aliases: summaryFit

### ** Examples

loading <- matrix(0, 6, 1)
loading[1:6, 1] <- NA
LY <- bind(loading, 0.7)
RPS <- binds(diag(1))
RTE <- binds(diag(6))
CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")

# We make the examples running only 5 replications to save time.
# In reality, more replications are needed.
Output <- sim(5, n=500, CFA.Model)

# Summarize the sample fit indices
summaryFit(Output)



