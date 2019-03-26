library(auditor)


### Name: plotResidualBoxplot
### Title: Plot Boxplots of Residuals
### Aliases: plotResidualBoxplot

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotResidual(lm_au)

library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plotResidualBoxplot(lm_au, rf_au)




