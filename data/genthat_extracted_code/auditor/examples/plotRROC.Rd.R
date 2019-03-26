library(auditor)


### Name: plotRROC
### Title: Regression Receiver Operating Characteristic (RROC)
### Aliases: plotRROC

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotRROC(lm_au)

library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plotRROC(lm_au, rf_au)




