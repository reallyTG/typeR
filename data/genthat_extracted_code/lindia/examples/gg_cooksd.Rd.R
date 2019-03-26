library(lindia)


### Name: gg_cooksd
### Title: Plot cook's distance graph
### Aliases: gg_cooksd

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_cooksd(cars_lm)




