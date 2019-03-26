library(BSDA)


### Name: Chicken
### Title: Weight gain of chickens fed three different rations
### Aliases: Chicken
### Keywords: datasets

### ** Examples


boxplot(gain ~ feed, col = c("red","blue","green"), data = Chicken)
anova(lm(gain ~ feed, data = Chicken))




