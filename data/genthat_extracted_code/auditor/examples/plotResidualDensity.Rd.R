library(auditor)


### Name: plotResidualDensity
### Title: Residual Density Plot
### Aliases: plotResidualDensity

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotResidualDensity(lm_au)

library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plotResidualDensity(lm_au, rf_au)




