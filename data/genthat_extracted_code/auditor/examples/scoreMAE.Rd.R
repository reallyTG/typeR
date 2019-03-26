library(auditor)


### Name: scoreMAE
### Title: Mean Absolute Error
### Aliases: scoreMAE

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreMAE(lm_au)





