library(coala)


### Name: simulator_scrm
### Title: Simulator: scrm
### Aliases: simulator_scrm activate_scrm

### ** Examples

# Change scrm's priority
model <- coal_model(10, 1) + feat_mutation(5)
model # scrm is used by default
activate_scrm(250)
model # Now ms is used instead (if installed)
activate_scrm(550)
model # Now scrm is used again



