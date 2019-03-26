library(lindia)


### Name: gg_resfitted
### Title: Generate residual plot of residuals against fitted value
### Aliases: gg_resfitted

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_resfitted(cars_lm)




