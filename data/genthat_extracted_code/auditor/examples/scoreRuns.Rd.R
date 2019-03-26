library(auditor)


### Name: scoreRuns
### Title: Runs Score
### Aliases: scoreRuns

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreRuns(lm_au)




