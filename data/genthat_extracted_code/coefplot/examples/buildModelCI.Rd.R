library(coefplot)


### Name: buildModelCI
### Title: buildModelCI
### Aliases: buildModelCI

### ** Examples


data(diamonds)
model1 <- lm(price ~ carat + cut, data=diamonds)
coefplot:::buildModelCI(model1)
coefplot(model1)




