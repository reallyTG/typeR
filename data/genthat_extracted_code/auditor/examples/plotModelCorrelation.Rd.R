library(auditor)


### Name: plotModelCorrelation
### Title: Model Correlation Plot
### Aliases: plotModelCorrelation

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plotModelCorrelation(lm_au, rf_au)




