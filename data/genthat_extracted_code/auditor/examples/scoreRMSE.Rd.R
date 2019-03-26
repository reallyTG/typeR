library(auditor)


### Name: scoreRMSE
### Title: Root Mean Square Error
### Aliases: scoreRMSE

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreRMSE(lm_au)





