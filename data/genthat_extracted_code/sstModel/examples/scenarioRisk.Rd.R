library(sstModel)


### Name: scenarioRisk
### Title: Constructing a scenarioRisk
### Aliases: scenarioRisk

### ** Examples

# Creating new scenarioRisk.
scenarios <- scenarioRisk(name        = c("earthquake",
                                          "real estate crash"),
                          probability = c(0.001, 0.01),
                          currency    = c("CHF", "CHF"),
                          effect        = c(1000, 10000))




