library(auditor)


### Name: scoreHalfNormal
### Title: Half-Normal Score
### Aliases: scoreHalfNormal

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotHalfNormal(lm_au)





