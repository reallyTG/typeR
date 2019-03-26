library(auditor)


### Name: scoreREC
### Title: Area Over the Curve for REC Curves
### Aliases: scoreREC

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
scoreREC(lm_au)





