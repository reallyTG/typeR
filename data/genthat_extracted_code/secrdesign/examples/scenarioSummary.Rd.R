library(secrdesign)


### Name: scenarioSummary
### Title: Summary of Scenarios
### Aliases: scenarioSummary

### ** Examples


scen <- make.scenarios(D = c(5,10), sigma = 25, lambda0 = 0.2, detectfn = 'HHN')
grid <- make.grid(6,6, detector = 'multi')
scenarioSummary(scen, list(grid), costing = TRUE, unitcost = list(perkm = 10))




