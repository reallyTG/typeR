library(BSDA)


### Name: Abc
### Title: Three samples to illustrate analysis of variance
### Aliases: Abc
### Keywords: datasets

### ** Examples


boxplot(response ~ group, col=c("red", "blue", "green"), data = Abc )
anova(lm(response ~ group, data = Abc))




