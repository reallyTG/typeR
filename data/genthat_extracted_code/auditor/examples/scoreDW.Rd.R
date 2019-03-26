library(auditor)


### Name: scoreDW
### Title: Durbin-Watson Score
### Aliases: scoreDW

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreDW(lm_au)





