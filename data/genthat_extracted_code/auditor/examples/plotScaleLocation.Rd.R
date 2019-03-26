library(auditor)


### Name: plotScaleLocation
### Title: Scale location plot
### Aliases: plotScaleLocation

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotScaleLocation(lm_au)





