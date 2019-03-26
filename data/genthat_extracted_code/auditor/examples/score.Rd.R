library(auditor)


### Name: score
### Title: Model Scores computations
### Aliases: score

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
score(lm_au, type = 'Runs')




