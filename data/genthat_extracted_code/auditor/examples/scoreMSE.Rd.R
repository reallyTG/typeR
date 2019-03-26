library(auditor)


### Name: scoreMSE
### Title: Mean Square Error
### Aliases: scoreMSE

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreMSE(lm_au)




