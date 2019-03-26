library(auditor)


### Name: plot.modelAudit
### Title: Model diagnostic plots
### Aliases: plot.modelAudit plot.modelFit plot.modelPerformance
###   plot.modelResiduals plot.observationInfluence

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plot(lm_au)

library(randomForest)
rf_model <- randomForest(prestige~education + women + income, data = Prestige)
rf_au <- audit(rf_model, data = Prestige, y = Prestige$prestige)
plot(lm_au, rf_au, type = "ModelRanking")





