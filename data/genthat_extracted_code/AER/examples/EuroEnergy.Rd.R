library(AER)


### Name: EuroEnergy
### Title: European Energy Consumption Data
### Aliases: EuroEnergy
### Keywords: datasets

### ** Examples

data("EuroEnergy")
energy_lm <- lm(log(energy) ~ log(gdp), data = EuroEnergy)
influence.measures(energy_lm)



