library(lindia)


### Name: gg_resleverage
### Title: Plot residual versus leverage plot in ggplot.
### Aliases: gg_resleverage

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_resleverage(cars_lm)



