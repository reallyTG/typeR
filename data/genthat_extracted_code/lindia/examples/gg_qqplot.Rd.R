library(lindia)


### Name: gg_qqplot
### Title: Plot quantile-quantile plot (QQPlot) in ggplot with qqline
###   shown.
### Aliases: gg_qqplot

### ** Examples

library(MASS)
data(Cars93)
cars_lm <- lm(Price ~ Passengers + Length + RPM, data = Cars93)
gg_qqplot(cars_lm)



