library(auditor)


### Name: scoreCooksDistance
### Title: Score based on Cooks Distance
### Aliases: scoreCooksDistance

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreCooksDistance(lm_au)





