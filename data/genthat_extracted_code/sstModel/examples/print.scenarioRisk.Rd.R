library(sstModel)


### Name: print.scenarioRisk
### Title: Printing a ScenarioRisk
### Aliases: print.scenarioRisk

### ** Examples

# Creating a new scenarioRisk.
scenarios <- scenarioRisk(name          = c("earthquake",
                                            "real estate crash"),
                          probability   = c(0.001, 0.01),
                          currency      = c("CHF", "CHF"),
                          effect        = c(-1000, -10000))
# printing the scenarioRisk.
print(scenarios)




