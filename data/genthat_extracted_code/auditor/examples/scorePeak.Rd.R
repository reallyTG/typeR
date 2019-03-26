library(auditor)


### Name: scorePeak
### Title: Peak Score
### Aliases: scorePeak

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scorePeak(lm_au)




