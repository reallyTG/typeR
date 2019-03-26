library(lindia)


### Name: gg_boxcox
### Title: Plot boxcox graph in ggplot with suggested lambda transformation
### Aliases: gg_boxcox

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_boxcox(cars_lm)




