library(coefplot)


### Name: buildModelCI.default
### Title: buildModelCI.default
### Aliases: buildModelCI.default

### ** Examples


data(diamonds, package='ggplot2')
model1 <- lm(price ~ carat + cut, data=diamonds)
coefplot:::buildModelCI(model1)
coefplot(model1)




