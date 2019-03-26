library(lindia)


### Name: gg_reshist
### Title: Generate histogram of residuals in ggplot.
### Aliases: gg_reshist

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price~ Passengers + Length + RPM, data = Cars93)
gg_reshist(cars_lm)
# specify number of bins
gg_reshist(cars_lm, bins = 20)



