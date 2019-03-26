library(auditor)


### Name: plotTwoSidedECDF
### Title: Two-sided Cumulative Distribution Function
### Aliases: plotTwoSidedECDF

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotTwoSidedECDF(lm_au)

library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plotTwoSidedECDF(lm_au, rf_au, y.reversed = TRUE)




