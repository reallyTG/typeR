library(auditor)


### Name: plotAutocorrelation
### Title: Autocorrelation Plot
### Aliases: plotAutocorrelation

### ** Examples

library(car)
lm_model <- lm(prestige~education + women + income, data = Prestige)
lm_au <- audit(lm_model, data = Prestige, y = Prestige$prestige)
plotAutocorrelation(lm_au)




