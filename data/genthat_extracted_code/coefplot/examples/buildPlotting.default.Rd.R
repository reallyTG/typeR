library(coefplot)


### Name: buildPlotting.default
### Title: Coefplot plotting
### Aliases: buildPlotting.default

### ** Examples


data(diamonds)
model1 <- lm(price ~ carat + cut, data=diamonds)
theCI <- coefplot:::buildModelCI(model1)
coefplot:::buildPlotting.default(theCI)
coefplot(model1)




