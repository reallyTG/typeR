library(lindia)


### Name: gg_scalelocation
### Title: Plot scale-location (also called spread-location plot) in
###   ggplot.
### Aliases: gg_scalelocation

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_scalelocation(cars_lm)



