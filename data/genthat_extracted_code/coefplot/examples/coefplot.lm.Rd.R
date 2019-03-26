library(coefplot)


### Name: coefplot.lm
### Title: coefplot.lm
### Aliases: coefplot.lm

### ** Examples


model1 <- lm(price ~ carat + cut*color, data=diamonds)
coefplot(model1)



