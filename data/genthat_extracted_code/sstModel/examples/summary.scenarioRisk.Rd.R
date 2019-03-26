library(sstModel)


### Name: summary.scenarioRisk
### Title: Summarizing a ScenarioRisk
### Aliases: summary.scenarioRisk

### ** Examples

# Creating a new scenarioRisk.
scenarios <- scenarioRisk(name          = c("earthquake",
                                            "real estate crash"),
                          probability   = c(0.001, 0.01),
                          currency      = c("CHF", "CHF"),
                          effect        = c(1000, 10000))
# summarizing the scenarioRisk.
summary(scenarios)




