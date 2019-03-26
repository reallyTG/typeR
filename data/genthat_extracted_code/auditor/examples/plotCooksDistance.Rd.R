library(auditor)


### Name: plotCooksDistance
### Title: Influence of observations plot
### Aliases: plotCooksDistance

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotCooksDistance(lm_au)




