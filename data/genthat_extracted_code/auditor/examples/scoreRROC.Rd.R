library(auditor)


### Name: scoreRROC
### Title: Area Over the Curve for RROC Curves
### Aliases: scoreRROC

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreRROC(lm_au)





